package com.seeclickfix.ma.android.util;

public class StringUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "StringUtil";
  
  public static String getFileNameFromUrl(String paramString)
  {
    return new String(paramString.substring(paramString.lastIndexOf("/") + 1, paramString.length()));
  }
  
  public static String removeExtension(String paramString)
  {
    return new String(paramString.substring(0, paramString.lastIndexOf(".")));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.StringUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */