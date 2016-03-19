package com.seeclickfix.ma.android.views.platform;

import android.widget.Scroller;

public class LegacyScroller
  implements SimpleScrollerCompat
{
  private Scroller scroller;
  
  public LegacyScroller(Scroller paramScroller)
  {
    scroller = paramScroller;
  }
  
  public void startScroll(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    scroller.startScroll(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.platform.LegacyScroller
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */