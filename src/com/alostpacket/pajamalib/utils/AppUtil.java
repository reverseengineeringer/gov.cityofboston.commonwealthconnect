package com.alostpacket.pajamalib.utils;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;

public class AppUtil
{
  public static String getAppName(Context paramContext)
  {
    return getApplicationInfoname;
  }
  
  public static String getVersionCode(Context paramContext)
  {
    try
    {
      paramContext = getPackageManagergetPackageInfogetPackageName0versionCode;
      return paramContext;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
    return "";
  }
  
  public static String getVersionName(Context paramContext)
  {
    try
    {
      paramContext = getPackageManagergetPackageInfogetPackageName0versionName;
      return paramContext;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
    return "";
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.AppUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */