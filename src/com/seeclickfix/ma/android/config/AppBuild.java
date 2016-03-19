package com.seeclickfix.ma.android.config;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.objects.DedicatedApp;

public class AppBuild
{
  public static final String API_KEY = "b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249";
  private static final String APP_NAME_SUFFIX = "-Android";
  private static final String COOKIE_INT = "_scf_session_key_app_int";
  private static final String COOKIE_PROD = "_scf_session_key";
  private static final String COOKIE_TEST = "_scf_session_key_app_test";
  public static final String CUSTOM = "ENVIRONMENT.CUSTOM";
  private static final boolean D = false;
  public static final boolean DEBUGGING = false;
  public static String DEFAULT_ENVIRONMENT = "ENVIRONMENT.PROD";
  private static final boolean GLOBAL_DEBUG = false;
  public static final String INT = "ENVIRONMENT.INT";
  private static final boolean LOCAL_DEBUG = true;
  public static final String PROD = "ENVIRONMENT.PROD";
  private static final String TAG = "AppBuild";
  public static final String TAG_PREFIX = "SCFAPP_";
  public static final String TEST = "ENVIRONMENT.TEST";
  
  public static String getAppName(Context paramContext)
  {
    return getApplicationInfoname;
  }
  
  public static final String getCookieName(Context paramContext)
  {
    paramContext = getEnvironment(paramContext);
    if (paramContext.equals("ENVIRONMENT.TEST")) {
      return "_scf_session_key_app_test";
    }
    if (paramContext.equals("ENVIRONMENT.INT")) {
      return "_scf_session_key_app_int";
    }
    return "_scf_session_key";
  }
  
  public static final String getEnvironment(Context paramContext)
  {
    paramContext = getHostname(paramContext);
    if ((paramContext.equals("ENVIRONMENT.PROD")) || (paramContext.equals("ENVIRONMENT.INT")) || (paramContext.equals("ENVIRONMENT.TEST"))) {
      return paramContext;
    }
    return "ENVIRONMENT.CUSTOM";
  }
  
  public static final String getHostname(Context paramContext)
  {
    return PrefsUtil.getString("PrefNames:ENVIRONMENT", DEFAULT_ENVIRONMENT, paramContext);
  }
  
  public static String getPackageName(Context paramContext)
  {
    try
    {
      paramContext = paramContext.getPackageName();
      return paramContext;
    }
    catch (Exception paramContext) {}
    return "";
  }
  
  public static String getUserAgent(Context paramContext)
  {
    return DedicatedAppManager.getDedicatedApp(paramContext).getAppId() + "-Android" + "/" + getVersionName(paramContext) + "." + getVersionCode(paramContext);
  }
  
  public static String getVersionCode(Context paramContext)
  {
    try
    {
      paramContext = paramContext.getPackageManager().getPackageInfo(paramContext.getPackageName(), 0);
      paramContext = versionCode + "";
      return paramContext;
    }
    catch (Exception paramContext) {}
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
  
  public static final void setEnvironment(String paramString, Context paramContext)
  {
    PrefsUtil.putString("PrefNames:ENVIRONMENT", paramString, paramContext);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.AppBuild
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */