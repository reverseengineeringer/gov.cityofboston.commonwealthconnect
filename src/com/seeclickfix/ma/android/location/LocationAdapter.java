package com.seeclickfix.ma.android.location;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.Builder;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.location.FusedLocationProviderApi;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.maps.LocationSource;
import com.google.android.gms.maps.LocationSource.OnLocationChangedListener;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.GooglePlayErrorEvent;
import com.seeclickfix.ma.android.events.LocationConnectedEvent;
import com.seeclickfix.ma.android.events.LocationNotEnabledEvent;
import com.seeclickfix.ma.android.events.LocationTimeoutEvent;
import com.seeclickfix.ma.android.events.LocationUpdateEvent;
import com.squareup.otto.Bus;
import com.squareup.otto.Produce;
import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class LocationAdapter
  implements LocationSource, LocationListener, GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "LocationAdapter";
  static Handler handler = new Handler();
  private static PendingIntent pendingIntent;
  @Inject
  Context context;
  private LocationSource.OnLocationChangedListener locSourceListener;
  @Inject
  LocationEnabledHelper locationEnabledHelper;
  private GoogleApiClient mClient;
  private Location mCurrentLocation;
  private boolean mForceFakeLocation = false;
  Runnable timeOutRunnable = new Runnable()
  {
    public void run()
    {
      LocationAdapter.this.postEvent(new LocationTimeoutEvent(mCurrentLocation));
    }
  };
  
  @Inject
  public LocationAdapter()
  {
    subscribeToBus();
  }
  
  private LocationRequest getLocationReqHighAcc()
  {
    LocationRequest localLocationRequest = new LocationRequest();
    localLocationRequest.setFastestInterval(200L);
    localLocationRequest.setInterval(2000L);
    localLocationRequest.setPriority(100);
    localLocationRequest.setSmallestDisplacement(0.0F);
    localLocationRequest.setNumUpdates(5);
    return localLocationRequest;
  }
  
  private boolean isLocationEnabled()
  {
    return locationEnabledHelper.isLocationEnabled();
  }
  
  private boolean isNewerCloserMoreAccurateOrSame(Location paramLocation)
  {
    boolean bool1 = LocationValidator.compare(LocationValidator.Stratigies.CompareStrategyEnum.CLOSER_MORE_RECENT, mCurrentLocation, paramLocation);
    boolean bool2 = LocationValidator.isPrecise(LocationValidator.Stratigies.PrecisionStrategyEnum.CLOSE, paramLocation);
    return (bool1) && (bool2);
  }
  
  private boolean isServiceAvailable()
  {
    return GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) == 0;
  }
  
  private void postEvent(Object paramObject)
  {
    MyApplication.getEventBus().post(paramObject);
  }
  
  private void startTimeoutClock()
  {
    stopTimeoutClock();
    handler.postDelayed(timeOutRunnable, 10000L);
  }
  
  private void stopTimeoutClock()
  {
    handler.removeCallbacks(timeOutRunnable);
  }
  
  private void subscribeToBus()
  {
    try
    {
      MyApplication.getEventBus().register(this);
      return;
    }
    catch (IllegalStateException localIllegalStateException) {}
  }
  
  public void activate(LocationSource.OnLocationChangedListener paramOnLocationChangedListener)
  {
    locSourceListener = paramOnLocationChangedListener;
    if ((mClient != null) && (mClient.isConnected()))
    {
      paramOnLocationChangedListener = getLocationReqHighAcc();
      LocationServices.FusedLocationApi.requestLocationUpdates(mClient, paramOnLocationChangedListener, this);
    }
  }
  
  public void deactivate()
  {
    locSourceListener = null;
  }
  
  public void forceMockLocation(PresetLocation paramPresetLocation)
  {
    mForceFakeLocation = true;
    mCurrentLocation = new Location(paramPresetLocation.provider());
    mCurrentLocation.setTime(paramPresetLocation.time());
    mCurrentLocation.setLatitude(paramPresetLocation.lat());
    mCurrentLocation.setLongitude(paramPresetLocation.lng());
    mCurrentLocation.setAccuracy(paramPresetLocation.accuracy());
  }
  
  @Produce
  public LocationUpdateEvent getLastLocationEvent()
  {
    Object localObject2 = null;
    Object localObject1;
    if (mForceFakeLocation) {
      localObject1 = new LocationUpdateEvent(mCurrentLocation);
    }
    Location localLocation;
    do
    {
      do
      {
        do
        {
          return (LocationUpdateEvent)localObject1;
          localObject1 = localObject2;
        } while (mClient == null);
        localObject1 = localObject2;
      } while (!mClient.isConnected());
      localLocation = LocationServices.FusedLocationApi.getLastLocation(mClient);
      localObject1 = localObject2;
    } while (!isNewerCloserMoreAccurateOrSame(localLocation));
    mCurrentLocation = localLocation;
    return new LocationUpdateEvent(mCurrentLocation);
  }
  
  public Location getLastLocationIfAvailable()
  {
    return mCurrentLocation;
  }
  
  public void onConnected(Bundle paramBundle)
  {
    if (!mForceFakeLocation) {
      mCurrentLocation = LocationServices.FusedLocationApi.getLastLocation(mClient);
    }
    postEvent(new LocationConnectedEvent(mCurrentLocation));
    startHighAccuracyLocationUpdates();
  }
  
  public void onConnectionFailed(ConnectionResult paramConnectionResult)
  {
    postEvent(new GooglePlayErrorEvent(paramConnectionResult));
  }
  
  public void onConnectionSuspended(int paramInt) {}
  
  public void onDisconnected()
  {
    stopActiveLocationUpdates();
  }
  
  public void onLocationChanged(Location paramLocation)
  {
    if (mForceFakeLocation) {
      postEvent(new LocationUpdateEvent(mCurrentLocation));
    }
    do
    {
      return;
      mCurrentLocation = paramLocation;
      startTimeoutClock();
      postEvent(new LocationUpdateEvent(mCurrentLocation));
    } while (locSourceListener == null);
    locSourceListener.onLocationChanged(mCurrentLocation);
  }
  
  public void releaseLocationFaking()
  {
    mForceFakeLocation = false;
    mCurrentLocation = null;
  }
  
  public void startHighAccuracyLocationUpdates()
  {
    if ((mClient == null) || (!mClient.isConnected())) {
      return;
    }
    stopActiveLocationUpdates();
    LocationRequest localLocationRequest = getLocationReqHighAcc();
    LocationServices.FusedLocationApi.requestLocationUpdates(mClient, localLocationRequest, this);
    startTimeoutClock();
  }
  
  public void startUpdates()
  {
    if (!isLocationEnabled()) {
      postEvent(new LocationNotEnabledEvent());
    }
    do
    {
      return;
      if (!isServiceAvailable())
      {
        postEvent(new GooglePlayErrorEvent(null));
        return;
      }
    } while (mClient != null);
    mClient = new GoogleApiClient.Builder(context).addApi(LocationServices.API).addConnectionCallbacks(this).addOnConnectionFailedListener(this).build();
    mClient.connect();
  }
  
  public void stopActiveLocationUpdates()
  {
    stopTimeoutClock();
    if ((mClient != null) && (mClient.isConnected())) {
      LocationServices.FusedLocationApi.removeLocationUpdates(mClient, this);
    }
  }
  
  public void stopUpdates()
  {
    stopActiveLocationUpdates();
    if (mClient != null)
    {
      mClient.disconnect();
      mClient = null;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */