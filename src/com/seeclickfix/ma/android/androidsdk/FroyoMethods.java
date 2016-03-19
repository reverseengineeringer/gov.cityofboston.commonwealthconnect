package com.seeclickfix.ma.android.androidsdk;

import android.widget.ListView;

public class FroyoMethods
  implements FroyoMethodInterface
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "SCFAPP_FroyoMethods";
  
  public void smoothScrollToPosition(int paramInt, ListView paramListView)
  {
    try
    {
      paramListView.smoothScrollToPosition(paramInt);
      return;
    }
    catch (Exception paramListView) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.androidsdk.FroyoMethods
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */