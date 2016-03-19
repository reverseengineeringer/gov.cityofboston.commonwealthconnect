package com.seeclickfix.ma.android.views.platform;

import android.widget.OverScroller;
import android.widget.Scroller;
import com.seeclickfix.ma.android.constants.ApiLevel;

public class PlatformSpecificScrollerFactory
{
  public static SimpleScrollerCompat getPlatformScroller(Object paramObject)
  {
    if (ApiLevel.SUPPORTS_GINGERBREAD) {
      return new GingerbreadScroller((OverScroller)paramObject);
    }
    return new LegacyScroller((Scroller)paramObject);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.platform.PlatformSpecificScrollerFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */