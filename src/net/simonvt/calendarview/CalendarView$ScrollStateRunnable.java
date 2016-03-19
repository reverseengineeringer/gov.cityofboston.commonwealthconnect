package net.simonvt.calendarview;

import android.view.View;
import android.widget.AbsListView;

class CalendarView$ScrollStateRunnable
  implements Runnable
{
  private int mNewState;
  private AbsListView mView;
  
  private CalendarView$ScrollStateRunnable(CalendarView paramCalendarView) {}
  
  public void doScrollStateChange(AbsListView paramAbsListView, int paramInt)
  {
    mView = paramAbsListView;
    mNewState = paramInt;
    this$0.removeCallbacks(this);
    this$0.postDelayed(this, 40L);
  }
  
  public void run()
  {
    CalendarView.access$1002(this$0, mNewState);
    int i;
    if ((mNewState == 0) && (CalendarView.access$1100(this$0) != 0))
    {
      View localView = mView.getChildAt(0);
      if (localView == null) {
        return;
      }
      i = localView.getBottom() - CalendarView.access$1200(this$0);
      if (i > CalendarView.access$1200(this$0))
      {
        if (!CalendarView.access$1300(this$0)) {
          break label106;
        }
        mView.smoothScrollBy(i - localView.getHeight(), 500);
      }
    }
    for (;;)
    {
      CalendarView.access$1102(this$0, mNewState);
      return;
      label106:
      mView.smoothScrollBy(i, 500);
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.calendarview.CalendarView.ScrollStateRunnable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */