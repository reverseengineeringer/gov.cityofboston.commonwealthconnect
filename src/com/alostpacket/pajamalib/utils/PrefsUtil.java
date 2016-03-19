package com.alostpacket.pajamalib.utils;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

public class PrefsUtil
{
  private static SharedPreferences prefs = null;
  
  public static void clearPrefs(Context paramContext)
  {
    if (prefs == null) {}
    for (paramContext = paramContext.getSharedPreferences(AppUtil.getAppName(paramContext) + ".prefs", 0);; paramContext = prefs)
    {
      prefs = paramContext;
      paramContext = prefs.edit();
      paramContext.clear();
      paramContext.commit();
      return;
    }
  }
  
  public static boolean getBoolean(String paramString, boolean paramBoolean, Context paramContext)
  {
    return getPrefs(paramContext).getBoolean(paramString, paramBoolean);
  }
  
  public static float getFloat(String paramString, float paramFloat, Context paramContext)
  {
    return getPrefs(paramContext).getFloat(paramString, paramFloat);
  }
  
  public static int getInt(String paramString, int paramInt, Context paramContext)
  {
    return getPrefs(paramContext).getInt(paramString, paramInt);
  }
  
  public static long getLong(String paramString, long paramLong, Context paramContext)
  {
    return getPrefs(paramContext).getLong(paramString, paramLong);
  }
  
  private static SharedPreferences getPrefs(Context paramContext)
  {
    if (prefs == null) {}
    for (paramContext = paramContext.getSharedPreferences(AppUtil.getAppName(paramContext) + ".prefs", 0);; paramContext = prefs)
    {
      prefs = paramContext;
      return prefs;
    }
  }
  
  public static String getString(String paramString1, String paramString2, Context paramContext)
  {
    return getPrefs(paramContext).getString(paramString1, paramString2);
  }
  
  public static void putBoolean(String paramString, boolean paramBoolean, Context paramContext)
  {
    paramContext = getPrefs(paramContext).edit();
    paramContext.putBoolean(paramString, paramBoolean);
    paramContext.commit();
  }
  
  public static void putFloat(String paramString, float paramFloat, Context paramContext)
  {
    paramContext = getPrefs(paramContext).edit();
    paramContext.putFloat(paramString, paramFloat);
    paramContext.commit();
  }
  
  public static void putInt(String paramString, int paramInt, Context paramContext)
  {
    paramContext = getPrefs(paramContext).edit();
    paramContext.putInt(paramString, paramInt);
    paramContext.commit();
  }
  
  public static void putLong(String paramString, long paramLong, Context paramContext)
  {
    paramContext = getPrefs(paramContext).edit();
    paramContext.putLong(paramString, paramLong);
    paramContext.commit();
  }
  
  public static void putString(String paramString1, String paramString2, Context paramContext)
  {
    paramContext = getPrefs(paramContext).edit();
    paramContext.putString(paramString1, paramString2);
    paramContext.commit();
  }
}

/* Location:
 * Qualified Name:     com.alostpacket.pajamalib.utils.PrefsUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */