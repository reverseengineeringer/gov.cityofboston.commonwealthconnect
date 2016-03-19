package com.seeclickfix.ma.android.views;

import android.content.Context;
import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.seeclickfix.ma.android.config.mappings.StatusMap;
import java.util.List;

public class ColorMarkers
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ColorMarkers";
  private static List<String> statusStates;
  
  public static BitmapDescriptor getDotByStatus(String paramString, Context paramContext)
  {
    statusStates = StatusMap.getStatusStateKeys();
    if (paramString == null) {
      return BitmapDescriptorFactory.fromResource(2130837829);
    }
    if (paramString.equals(statusStates.get(0))) {
      return BitmapDescriptorFactory.fromResource(2130837833);
    }
    if (paramString.equals(statusStates.get(1))) {
      return BitmapDescriptorFactory.fromResource(2130837831);
    }
    if (paramString.equals(statusStates.get(2))) {
      return BitmapDescriptorFactory.fromResource(2130837827);
    }
    return BitmapDescriptorFactory.fromResource(2130837829);
  }
  
  public static BitmapDescriptor getPinByStatus(String paramString, Context paramContext)
  {
    statusStates = StatusMap.getStatusStateKeys();
    if (paramString == null) {
      return BitmapDescriptorFactory.fromResource(2130837830);
    }
    if (paramString.equals(statusStates.get(0))) {
      return BitmapDescriptorFactory.fromResource(2130837834);
    }
    if (paramString.equals(statusStates.get(1))) {
      return BitmapDescriptorFactory.fromResource(2130837832);
    }
    if (paramString.equals(statusStates.get(2))) {
      return BitmapDescriptorFactory.fromResource(2130837828);
    }
    return BitmapDescriptorFactory.fromResource(2130837830);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ColorMarkers
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */