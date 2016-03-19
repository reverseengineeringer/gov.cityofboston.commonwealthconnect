package com.seeclickfix.ma.android.fragments;

import android.content.Context;
import android.location.Address;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnCameraChangeListener;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.GoogleMap.OnMapLongClickListener;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.SupportMapFragment;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CameraPosition.Builder;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.OnMapBackKeyListener;
import com.seeclickfix.ma.android.fragments.interfaces.OnReportLocationListener;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.SimpleState;
import com.seeclickfix.ma.android.fragments.map.MapHelper;
import com.seeclickfix.ma.android.fragments.map.MapOptionsFactory;
import com.seeclickfix.ma.android.location.AddressLocalizer;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.objects.PageParams;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.tasks.ReverseGeocodeTask;
import com.seeclickfix.ma.android.views.ColorMarkers;
import javax.inject.Inject;

public class ReportMapFrag
  extends BaseFrag
  implements OnMapBackKeyListener
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ReportMapFrag";
  private Context c;
  private CameraPosition camPosition;
  private Runnable exposeSearch;
  private final Handler handler = new Handler();
  private TextView headerText;
  @Inject
  LocationAdapter locationAdapter;
  private GoogleMap mMap;
  private SupportMapFragment mMapFragment;
  private GoogleMap.OnMapClickListener mapClickListener;
  @Inject
  MapHelper mapHelper;
  private GoogleMap.OnMapLongClickListener mapLongClickListener;
  private Marker marker;
  private GoogleMapOptions options;
  private LatLng previousLatLng;
  private Report report;
  private PageParams returnPageParams;
  private Button saveBtn;
  private View.OnClickListener saveBtnListener;
  
  private void attachListeners()
  {
    saveBtn.setOnClickListener(saveBtnListener);
  }
  
  private GoogleMapOptions getMapOptions()
  {
    Object localObject1 = (GoogleMapOptions)getArguments().getParcelable("map_options");
    Object localObject2 = localObject1;
    if (localObject1 == null)
    {
      localObject1 = locationAdapter.getLastLocationIfAvailable();
      if (report != null)
      {
        camPosition = report.getCamPosition();
        previousLatLng = report.getLatLng();
      }
      if ((camPosition == null) || (previousLatLng == null)) {
        break label125;
      }
      localObject1 = MapOptionsFactory.getPreviousOptions(previousLatLng, camPosition.zoom);
    }
    for (;;)
    {
      ((GoogleMapOptions)localObject1).scrollGesturesEnabled(true);
      ((GoogleMapOptions)localObject1).zoomGesturesEnabled(true);
      ((GoogleMapOptions)localObject1).zoomControlsEnabled(true);
      localObject2 = localObject1;
      if (camPosition != null)
      {
        ((GoogleMapOptions)localObject1).camera(camPosition);
        localObject2 = localObject1;
      }
      return (GoogleMapOptions)localObject2;
      label125:
      if (localObject1 != null) {
        localObject1 = MapOptionsFactory.getMiniMapOptions((Location)localObject1);
      } else {
        localObject1 = MapOptionsFactory.getStandardOptions();
      }
    }
  }
  
  private void handleClick(LatLng paramLatLng)
  {
    if (marker != null) {
      marker.remove();
    }
    mMap.clear();
    MarkerOptions localMarkerOptions = new MarkerOptions();
    localMarkerOptions.position(paramLatLng);
    localMarkerOptions.icon(ColorMarkers.getPinByStatus("Open", c));
    marker = mMap.addMarker(localMarkerOptions);
    updateCamPosition();
    exposeSearch = new Runnable()
    {
      public void run()
      {
        if (marker != null)
        {
          marker.setTitle(getString(2131493124));
          marker.showInfoWindow();
        }
      }
    };
    handler.postDelayed(exposeSearch, 1000L);
    ReverseGeocodeTask.launch("ReportMapFrag", paramLatLng, this, new SafeListener(this, new SimpleListener()
    {
      public void onFailure(SimpleListener.Code paramAnonymousCode)
      {
        marker.setTitle(getString(2131493123));
        marker.showInfoWindow();
      }
      
      public void onSuccess(Address paramAnonymousAddress)
      {
        if (marker != null)
        {
          paramAnonymousAddress = AddressLocalizer.getAddressString(paramAnonymousAddress);
          marker.setTitle(paramAnonymousAddress);
          marker.showInfoWindow();
          ReportMapFrag.this.saveLatLng(marker.getPosition());
        }
      }
    })
    {
      public void onStateChange(SimpleListener.SimpleState paramAnonymousSimpleState, boolean paramAnonymousBoolean)
      {
        if (paramAnonymousSimpleState == SimpleListener.SimpleState.FINISHED) {
          handler.removeCallbacks(exposeSearch);
        }
      }
    });
  }
  
  public static ReportMapFrag newInstance()
  {
    return new ReportMapFrag();
  }
  
  private void saveLatLng(LatLng paramLatLng)
  {
    getArguments().putParcelable("marker_latlng", paramLatLng);
  }
  
  private void setReferences()
  {
    headerText = ((TextView)rootFrag.findViewById(2131361960));
    saveBtn = ((Button)rootFrag.findViewById(2131362068));
  }
  
  private void setUpMapIfNeeded()
  {
    if (mMap == null)
    {
      mMap = mMapFragment.getMap();
      if (mMap != null) {
        setupMap();
      }
      return;
    }
    setupMap();
  }
  
  private void setupListeners()
  {
    saveBtnListener = new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        popThisFragment(true);
      }
    };
    mapClickListener = new GoogleMap.OnMapClickListener()
    {
      public void onMapClick(LatLng paramAnonymousLatLng)
      {
        ReportMapFrag.this.handleClick(paramAnonymousLatLng);
      }
    };
    mapLongClickListener = new GoogleMap.OnMapLongClickListener()
    {
      public void onMapLongClick(LatLng paramAnonymousLatLng)
      {
        ReportMapFrag.this.handleClick(paramAnonymousLatLng);
      }
    };
  }
  
  private void setupMap()
  {
    mMap.setMyLocationEnabled(true);
    mMap.setLocationSource(locationAdapter);
    mMap.setOnMapClickListener(mapClickListener);
    mMap.setOnMapLongClickListener(mapLongClickListener);
    if (previousLatLng != null)
    {
      MarkerOptions localMarkerOptions = new MarkerOptions();
      localMarkerOptions.position(previousLatLng);
      localMarkerOptions.title(report.getAddress());
      localMarkerOptions.icon(ColorMarkers.getPinByStatus("Open", c));
      mMap.clear();
      marker = mMap.addMarker(localMarkerOptions);
      marker.showInfoWindow();
    }
    for (;;)
    {
      mMap.setOnCameraChangeListener(new GoogleMap.OnCameraChangeListener()
      {
        public void onCameraChange(CameraPosition paramAnonymousCameraPosition)
        {
          ReportMapFrag.access$502(ReportMapFrag.this, paramAnonymousCameraPosition);
        }
      });
      return;
      try
      {
        handleClick(getLatLng());
      }
      catch (Exception localException) {}
    }
  }
  
  private void updateCamPosition()
  {
    camPosition = new CameraPosition.Builder().target(new LatLng(marker.getPosition().latitude, marker.getPosition().longitude)).zoom(mMap.getCameraPosition().zoom).tilt(mMap.getCameraPosition().tilt).bearing(mMap.getCameraPosition().bearing).build();
    mMap.animateCamera(CameraUpdateFactory.newCameraPosition(camPosition));
  }
  
  public LatLng getLatLng()
  {
    LatLng localLatLng = (LatLng)getArguments().getParcelable("marker_latlng");
    if (localLatLng != null) {
      return localLatLng;
    }
    return mMap.getCameraPosition().target;
  }
  
  public NoticeItem getNotice()
  {
    return null;
  }
  
  public void onBackKey()
  {
    popThisFragment(false);
  }
  
  public void onCreate(Bundle paramBundle)
  {
    super.onCreate(paramBundle);
  }
  
  public View onCreateView(LayoutInflater paramLayoutInflater, ViewGroup paramViewGroup, Bundle paramBundle)
  {
    if (paramViewGroup == null) {
      return null;
    }
    rootFrag = ((ViewGroup)paramLayoutInflater.inflate(2130903094, paramViewGroup, false));
    returnPageParams = ((PageParams)getArguments().getParcelable("page_params"));
    report = ((Report)returnPageParams.getParcel());
    MyApplication.inject(this);
    mMapFragment = mapHelper.initMap(this, 2131362070, getMapOptions());
    return rootFrag;
  }
  
  public void onDetach()
  {
    super.onDetach();
  }
  
  public void onPause()
  {
    super.onPause();
    getArguments().putParcelable("map_options", getMapOptions());
  }
  
  public void onResume()
  {
    super.onResume();
    c = getActivity().getApplicationContext();
    setReferences();
    setupListeners();
    setUpMapIfNeeded();
    attachListeners();
    subscribeToEventBus();
    locationAdapter.startHighAccuracyLocationUpdates();
  }
  
  public void onStop()
  {
    super.onStop();
    ReverseGeocodeTask.cancel("ReportMapFrag");
    handler.removeCallbacks(exposeSearch);
  }
  
  protected void popThisFragment(boolean paramBoolean)
  {
    OnReportLocationListener localOnReportLocationListener = (OnReportLocationListener)getSherlockActivity();
    if ((marker != null) && (paramBoolean))
    {
      LatLng localLatLng = marker.getPosition();
      if (localLatLng != null)
      {
        if ((report.getLatLng() != null) && (report.getLatLng() != localLatLng)) {
          report.setLatLngModified(true);
        }
        report.setIsUsingCurrentLocation(false);
        report.setAddress(marker.getTitle());
        report.setLatLng(localLatLng);
        report.setCamPosition(camPosition);
        marker.remove();
        marker = null;
      }
    }
    returnPageParams.setParcel(report);
    localOnReportLocationListener.onReportLocationSet(returnPageParams);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportMapFrag
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */