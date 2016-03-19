package com.seeclickfix.ma.android.views.swipe;

import android.view.View;

class SwipeDismissListViewTouchListener$PendingDismissData
  implements Comparable<PendingDismissData>
{
  public int position;
  public View view;
  
  public SwipeDismissListViewTouchListener$PendingDismissData(SwipeDismissListViewTouchListener paramSwipeDismissListViewTouchListener, int paramInt, View paramView)
  {
    position = paramInt;
    view = paramView;
  }
  
  public int compareTo(PendingDismissData paramPendingDismissData)
  {
    return position - position;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.swipe.SwipeDismissListViewTouchListener.PendingDismissData
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */