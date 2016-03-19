package com.seeclickfix.ma.android.views.swipe;

import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;

class SwipeDismissListViewTouchListener$1
  implements AbsListView.OnScrollListener
{
  SwipeDismissListViewTouchListener$1(SwipeDismissListViewTouchListener paramSwipeDismissListViewTouchListener) {}
  
  public void onScroll(AbsListView paramAbsListView, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onScrollStateChanged(AbsListView paramAbsListView, int paramInt)
  {
    boolean bool = true;
    paramAbsListView = this$0;
    if (paramInt != 1) {}
    for (;;)
    {
      paramAbsListView.setEnabled(bool);
      return;
      bool = false;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissListViewTouchListener.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */