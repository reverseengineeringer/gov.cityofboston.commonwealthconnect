package com.seeclickfix.ma.android.location;

import android.content.Context;
import android.content.res.Resources;
import android.location.Location;
import com.seeclickfix.ma.android.objects.loc.Place;

public class MyPlaceFactory
{
  public static Place create(Location paramLocation, Context paramContext)
  {
    paramContext = paramContext.getResources().getString(2131493068);
    Place localPlace = new Place();
    localPlace.setApiId(-1);
    localPlace.setName(paramContext);
    localPlace.setMyLocation(true);
    localPlace.setPlaceLat(paramLocation.getLatitude());
    localPlace.setPlaceLng(paramLocation.getLongitude());
    return localPlace;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.MyPlaceFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */