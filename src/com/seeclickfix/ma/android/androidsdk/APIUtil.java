package com.seeclickfix.ma.android.androidsdk;

import android.os.Build.VERSION;

public class APIUtil
{
  public static boolean hasFroyo()
  {
    return Build.VERSION.SDK_INT >= 8;
  }
  
  public static boolean hasGingerbread()
  {
    return Build.VERSION.SDK_INT >= 9;
  }
  
  public static boolean hasHoneycomb()
  {
    return Build.VERSION.SDK_INT >= 11;
  }
  
  public static boolean hasHoneycombMR1()
  {
    return Build.VERSION.SDK_INT >= 12;
  }
  
  public static boolean hasJellyBean()
  {
    return Build.VERSION.SDK_INT >= 16;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.androidsdk.APIUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */