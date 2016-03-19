package com.seeclickfix.ma.android.location;

import android.content.Context;
import android.location.LocationManager;
import java.util.Iterator;
import java.util.List;
import javax.inject.Inject;
import javax.inject.Singleton;

@Singleton
public class LocationEnabledHelper
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "LocationEnabledHelper";
  @Inject
  Context context;
  @Inject
  LocationManager locationManager;
  
  public boolean isLocationEnabled()
  {
    Iterator localIterator = locationManager.getProviders(true).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      if ((str.equalsIgnoreCase("gps")) || (str.equalsIgnoreCase("network"))) {
        return true;
      }
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.location.LocationEnabledHelper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */