package com.seeclickfix.ma.android.views.platform;

import android.widget.OverScroller;

public class GingerbreadScroller
  implements SimpleScrollerCompat
{
  private OverScroller scroller;
  
  public GingerbreadScroller(OverScroller paramOverScroller)
  {
    scroller = paramOverScroller;
  }
  
  public void startScroll(int paramInt1, int paramInt2, int paramInt3, int paramInt4, int paramInt5)
  {
    scroller.startScroll(paramInt1, paramInt2, paramInt3, paramInt4, paramInt5);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.platform.GingerbreadScroller
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */