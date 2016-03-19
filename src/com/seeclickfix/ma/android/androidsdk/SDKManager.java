package com.seeclickfix.ma.android.androidsdk;

import android.app.Activity;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.ListView;

public class SDKManager
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_SDKManager";
  private static FroyoMethodInterface froyoMethods;
  private static HoneycombMethodInterface hcMethods;
  private static ICSMethodInterface icsMethods;
  
  public static float getReportedDensity(Activity paramActivity)
    throws NullPointerException
  {
    return getResourcesgetDisplayMetricsdensity;
  }
  
  public static boolean handleOptionsItemSelected(MenuItem paramMenuItem, Activity paramActivity)
  {
    
    if (hcMethods != null) {
      return hcMethods.handleOptionClick(paramMenuItem, paramActivity);
    }
    return false;
  }
  
  public static void hideActionBar(Activity paramActivity)
  {
    
    if (hcMethods != null) {
      hcMethods.hideActionBar(paramActivity);
    }
  }
  
  public static void instantiateFroyoMethodObj()
  {
    if ((Build.VERSION.SDK_INT >= 8) && (froyoMethods == null)) {
      froyoMethods = new FroyoMethods();
    }
  }
  
  public static void instantiateHCMethodObj()
  {
    if ((Build.VERSION.SDK_INT >= 11) && (hcMethods == null)) {
      hcMethods = new HoneycombMethods();
    }
  }
  
  public static void instantiateICSMethodObj()
  {
    if ((Build.VERSION.SDK_INT >= 14) && (icsMethods == null)) {
      icsMethods = new ICSMethods();
    }
  }
  
  public static boolean isHoneycombOrAbove()
  {
    return Build.VERSION.SDK_INT >= 11;
  }
  
  public static boolean isHoneycombTablet(Activity paramActivity)
  {
    try
    {
      if (isScreenSizeXlarge(paramActivity))
      {
        boolean bool = isHoneycombOrAbove();
        if (bool) {
          return true;
        }
      }
      return false;
    }
    catch (Exception paramActivity) {}
    return false;
  }
  
  public static boolean isScreenSizeXlarge(Activity paramActivity)
    throws NullPointerException
  {
    paramActivity = paramActivity.getResources().getDisplayMetrics();
    double d1 = widthPixels / xdpi;
    double d2 = heightPixels / ydpi;
    return Math.sqrt(d1 * d1 + d2 * d2) >= 6.5D;
  }
  
  public static void requestActionBar(Activity paramActivity)
  {
    
    if (hcMethods != null) {
      hcMethods.requestActionBar(paramActivity);
    }
  }
  
  public static void setupActionBar(Activity paramActivity)
  {
    instantiateHCMethodObj();
    instantiateICSMethodObj();
    Object localObject = null;
    if (hcMethods != null) {
      localObject = hcMethods.setupActionBar(paramActivity);
    }
    if (icsMethods != null) {
      icsMethods.setHomeButtonEnabled(localObject, true);
    }
  }
  
  public static void setupHoneycombSearch(Activity paramActivity, Menu paramMenu)
  {
    
    if (hcMethods != null) {
      hcMethods.setupHoneycombSearch(paramActivity, paramMenu);
    }
  }
  
  public static void smoothScrollToPosition(ListView paramListView, int paramInt)
  {
    
    if (froyoMethods != null)
    {
      froyoMethods.smoothScrollToPosition(paramInt, paramListView);
      return;
    }
    paramListView.setSelection(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.androidsdk.SDKManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */