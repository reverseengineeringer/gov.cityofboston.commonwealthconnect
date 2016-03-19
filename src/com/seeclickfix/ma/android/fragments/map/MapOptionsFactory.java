package com.seeclickfix.ma.android.fragments.map;

import android.location.Location;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.CameraPosition.Builder;
import com.google.android.gms.maps.model.LatLng;
import com.seeclickfix.ma.android.constants.LocationConstants;

public class MapOptionsFactory
{
  public static GoogleMapOptions getMiniMapOptions(Location paramLocation)
  {
    LatLng localLatLng = LocationConstants.US_CENTER_LATLNG;
    float f2 = 2.0F;
    Object localObject = localLatLng;
    float f1 = f2;
    if (paramLocation != null)
    {
      paramLocation = new LatLng(paramLocation.getLatitude(), paramLocation.getLongitude());
      localObject = localLatLng;
      f1 = f2;
      if (paramLocation != null)
      {
        localObject = paramLocation;
        f1 = 17.0F;
      }
    }
    paramLocation = CameraPosition.builder();
    paramLocation.bearing(0.0F);
    paramLocation.target((LatLng)localObject);
    paramLocation.zoom(f1);
    paramLocation = paramLocation.build();
    localObject = new GoogleMapOptions();
    ((GoogleMapOptions)localObject).zOrderOnTop(false);
    ((GoogleMapOptions)localObject).compassEnabled(false);
    ((GoogleMapOptions)localObject).scrollGesturesEnabled(false);
    ((GoogleMapOptions)localObject).rotateGesturesEnabled(false);
    ((GoogleMapOptions)localObject).tiltGesturesEnabled(false);
    ((GoogleMapOptions)localObject).zoomControlsEnabled(false);
    ((GoogleMapOptions)localObject).mapType(1);
    ((GoogleMapOptions)localObject).camera(paramLocation);
    return (GoogleMapOptions)localObject;
  }
  
  public static GoogleMapOptions getPreviousOptions(LatLng paramLatLng, float paramFloat)
  {
    Object localObject = CameraPosition.builder();
    ((CameraPosition.Builder)localObject).bearing(0.0F);
    ((CameraPosition.Builder)localObject).target(paramLatLng);
    ((CameraPosition.Builder)localObject).zoom(paramFloat);
    paramLatLng = ((CameraPosition.Builder)localObject).build();
    localObject = new GoogleMapOptions();
    ((GoogleMapOptions)localObject).zOrderOnTop(false);
    ((GoogleMapOptions)localObject).compassEnabled(false);
    ((GoogleMapOptions)localObject).scrollGesturesEnabled(false);
    ((GoogleMapOptions)localObject).rotateGesturesEnabled(false);
    ((GoogleMapOptions)localObject).tiltGesturesEnabled(false);
    ((GoogleMapOptions)localObject).zoomControlsEnabled(true);
    ((GoogleMapOptions)localObject).mapType(1);
    ((GoogleMapOptions)localObject).camera(paramLatLng);
    return (GoogleMapOptions)localObject;
  }
  
  public static GoogleMapOptions getStandardOptions()
  {
    Object localObject = CameraPosition.builder();
    ((CameraPosition.Builder)localObject).bearing(0.0F);
    ((CameraPosition.Builder)localObject).target(LocationConstants.US_CENTER_LATLNG);
    ((CameraPosition.Builder)localObject).zoom(4.0F);
    localObject = ((CameraPosition.Builder)localObject).build();
    GoogleMapOptions localGoogleMapOptions = new GoogleMapOptions();
    localGoogleMapOptions.zOrderOnTop(false);
    localGoogleMapOptions.compassEnabled(false);
    localGoogleMapOptions.scrollGesturesEnabled(false);
    localGoogleMapOptions.rotateGesturesEnabled(false);
    localGoogleMapOptions.tiltGesturesEnabled(false);
    localGoogleMapOptions.zoomControlsEnabled(true);
    localGoogleMapOptions.mapType(1);
    localGoogleMapOptions.camera((CameraPosition)localObject);
    return localGoogleMapOptions;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.map.MapOptionsFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */