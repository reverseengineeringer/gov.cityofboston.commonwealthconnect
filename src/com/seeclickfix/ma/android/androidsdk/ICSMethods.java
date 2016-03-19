package com.seeclickfix.ma.android.androidsdk;

import android.annotation.SuppressLint;
import android.app.ActionBar;

@SuppressLint({"NewApi"})
public class ICSMethods
  implements ICSMethodInterface
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_ICSMethods";
  
  public void setHomeButtonEnabled(Object paramObject, boolean paramBoolean)
  {
    try
    {
      ((ActionBar)paramObject).setHomeButtonEnabled(paramBoolean);
      return;
    }
    catch (Exception paramObject) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.androidsdk.ICSMethods
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */