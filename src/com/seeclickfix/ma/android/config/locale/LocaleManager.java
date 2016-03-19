package com.seeclickfix.ma.android.config.locale;

import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import java.util.Locale;

public class LocaleManager
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  public static final String SYSTEM_LOCALE = "system";
  private static final String TAG = "LocaleManager";
  private static Locale locale = null;
  
  public static String getAppLanguage()
  {
    if (isLocaleDefault()) {
      return "system";
    }
    return locale.getLanguage();
  }
  
  public static String getCountry(Context paramContext)
  {
    return getLocale(paramContext).getCountry();
  }
  
  public static boolean getIsUS(Context paramContext)
  {
    return getCountry(paramContext).equals("US");
  }
  
  public static String getLanguage(Context paramContext)
  {
    return getLocale(paramContext).getLanguage();
  }
  
  public static Locale getLocale(Context paramContext)
  {
    return getResourcesgetConfigurationlocale;
  }
  
  public static String getLocaleString(Context paramContext)
  {
    return getLocale(paramContext).toString().replace("_", "-");
  }
  
  public static boolean isLocaleDefault()
  {
    return (locale == null) || (locale.getLanguage().isEmpty());
  }
  
  public static void onConfigurationChange(Configuration paramConfiguration)
  {
    if ((locale != null) && (!locale.getLanguage().equals(locale.getLanguage()))) {
      setAppLocale(locale.getLanguage());
    }
  }
  
  public static void overrideLocale(String paramString, Application paramApplication)
  {
    Configuration localConfiguration = paramApplication.getBaseContext().getResources().getConfiguration();
    String str = paramString;
    if (paramString.equals("system")) {
      str = "";
    }
    PrefsUtil.putString("PrefNames:LOCALE_CUSTOM", str, paramApplication.getApplicationContext());
    if ((str.isEmpty()) || (str.equals(locale.getLanguage()))) {
      return;
    }
    locale = setAppLocale(str);
    paramApplication.getBaseContext().getResources().updateConfiguration(localConfiguration, paramApplication.getBaseContext().getResources().getDisplayMetrics());
  }
  
  public static Locale setAppLocale(String paramString)
  {
    locale = new Locale(paramString);
    Locale.setDefault(locale);
    return locale;
  }
  
  public static void updateLocale(Application paramApplication)
  {
    overrideLocale(PrefsUtil.getString("PrefNames:LOCALE_CUSTOM", "", paramApplication.getApplicationContext()), paramApplication);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.config.locale.LocaleManager
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */