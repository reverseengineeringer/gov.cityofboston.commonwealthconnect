package com.seeclickfix.ma.android.views;

import android.graphics.drawable.StateListDrawable;

public class ZoneButtonStateList
  extends StateListDrawable
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ZoneButtonStateList";
  
  protected boolean onStateChange(int[] paramArrayOfInt)
  {
    int j = paramArrayOfInt.length;
    int i = 0;
    while (i < j)
    {
      int k = paramArrayOfInt[i];
      i += 1;
    }
    invalidateSelf();
    return true;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.ZoneButtonStateList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */