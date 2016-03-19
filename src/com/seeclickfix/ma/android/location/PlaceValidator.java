package com.seeclickfix.ma.android.location;

import android.location.Location;
import com.seeclickfix.ma.android.objects.loc.Place;

public class PlaceValidator
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "PlaceValidator";
  
  public static boolean isPlaceNearLocation(Place paramPlace, Location paramLocation)
  {
    boolean bool = false;
    float[] arrayOfFloat = new float[3];
    Location.distanceBetween(paramPlace.getPlaceLat(), paramPlace.getPlaceLng(), paramLocation.getLatitude(), paramLocation.getLongitude(), arrayOfFloat);
    if (arrayOfFloat[0] < 200.0F) {
      bool = true;
    }
    return bool;
  }
  
  public static boolean isPlaceRecent(Place paramPlace)
  {
    long l = paramPlace.getLastPlaceUpdateFromApi();
    return System.currentTimeMillis() - l < 900000L;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.PlaceValidator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */