package com.seeclickfix.ma.android.util;

import android.os.Handler;
import android.os.Message;

public class HandlerUtils
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "HandlerUtils";
  
  public static void showError(Handler paramHandler, String paramString)
  {
    if (paramHandler == null) {
      return;
    }
    try
    {
      paramHandler.obtainMessage(900, "Error: " + paramString).sendToTarget();
      return;
    }
    catch (Exception paramHandler) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.util.HandlerUtils
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */