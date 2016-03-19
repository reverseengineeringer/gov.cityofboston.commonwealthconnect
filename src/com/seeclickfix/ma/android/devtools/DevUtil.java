package com.seeclickfix.ma.android.devtools;

import android.annotation.SuppressLint;
import android.os.StrictMode;
import android.os.StrictMode.ThreadPolicy.Builder;
import android.os.StrictMode.VmPolicy.Builder;

public class DevUtil
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DevUtil";
  
  @SuppressLint({"NewApi"})
  public static final void setStrictModeOn()
  {
    StrictMode.setThreadPolicy(new StrictMode.ThreadPolicy.Builder().detectAll().penaltyLog().build());
    StrictMode.setVmPolicy(new StrictMode.VmPolicy.Builder().detectLeakedSqlLiteObjects().detectLeakedClosableObjects().penaltyLog().penaltyDeath().build());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.devtools.DevUtil
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */