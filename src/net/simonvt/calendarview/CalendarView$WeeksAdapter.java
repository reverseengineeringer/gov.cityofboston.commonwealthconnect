package net.simonvt.calendarview;

import android.content.Context;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.widget.AbsListView.LayoutParams;
import android.widget.BaseAdapter;
import android.widget.ListView;
import java.util.Calendar;

class CalendarView$WeeksAdapter
  extends BaseAdapter
  implements View.OnTouchListener
{
  private int mFocusedMonth;
  private GestureDetector mGestureDetector = new GestureDetector(paramCalendarView.getContext(), new CalendarGestureListener());
  private final Calendar mSelectedDate = Calendar.getInstance();
  private int mSelectedWeek;
  private int mTotalWeekCount;
  
  public CalendarView$WeeksAdapter(CalendarView paramCalendarView, Context paramContext)
  {
    init();
  }
  
  private void init()
  {
    mSelectedWeek = CalendarView.access$1400(this$0, mSelectedDate);
    mTotalWeekCount = CalendarView.access$1400(this$0, CalendarView.access$1500(this$0));
    if ((CalendarView.access$1600(this$0).get(7) != CalendarView.access$1700(this$0)) || (CalendarView.access$1500(this$0).get(7) != CalendarView.access$1700(this$0))) {
      mTotalWeekCount += 1;
    }
  }
  
  private void onDateTapped(Calendar paramCalendar)
  {
    setSelectedDay(paramCalendar);
    CalendarView.access$2000(this$0, paramCalendar);
  }
  
  public int getCount()
  {
    return mTotalWeekCount;
  }
  
  public Object getItem(int paramInt)
  {
    return null;
  }
  
  public long getItemId(int paramInt)
  {
    return paramInt;
  }
  
  public Calendar getSelectedDay()
  {
    return mSelectedDate;
  }
  
  public View getView(int paramInt, View paramView, ViewGroup paramViewGroup)
  {
    if (paramView != null)
    {
      paramView = (CalendarView.WeekView)paramView;
      if (mSelectedWeek != paramInt) {
        break label88;
      }
    }
    label88:
    for (int i = mSelectedDate.get(7);; i = -1)
    {
      paramView.init(paramInt, i, mFocusedMonth);
      return paramView;
      paramView = new CalendarView.WeekView(this$0, this$0.getContext());
      paramView.setLayoutParams(new AbsListView.LayoutParams(-2, -2));
      paramView.setClickable(true);
      paramView.setOnTouchListener(this);
      break;
    }
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    if ((CalendarView.access$1800(this$0).isEnabled()) && (mGestureDetector.onTouchEvent(paramMotionEvent)))
    {
      if (!((CalendarView.WeekView)paramView).getDayFromLocation(paramMotionEvent.getX(), CalendarView.access$1900(this$0))) {}
      while ((CalendarView.access$1900(this$0).before(CalendarView.access$1600(this$0))) || (CalendarView.access$1900(this$0).after(CalendarView.access$1500(this$0)))) {
        return true;
      }
      onDateTapped(CalendarView.access$1900(this$0));
      return true;
    }
    return false;
  }
  
  public void setFocusMonth(int paramInt)
  {
    if (mFocusedMonth == paramInt) {
      return;
    }
    mFocusedMonth = paramInt;
    notifyDataSetChanged();
  }
  
  public void setSelectedDay(Calendar paramCalendar)
  {
    if ((paramCalendar.get(6) == mSelectedDate.get(6)) && (paramCalendar.get(1) == mSelectedDate.get(1))) {
      return;
    }
    mSelectedDate.setTimeInMillis(paramCalendar.getTimeInMillis());
    mSelectedWeek = CalendarView.access$1400(this$0, mSelectedDate);
    mFocusedMonth = mSelectedDate.get(2);
    notifyDataSetChanged();
  }
  
  class CalendarGestureListener
    extends GestureDetector.SimpleOnGestureListener
  {
    CalendarGestureListener() {}
    
    public boolean onSingleTapUp(MotionEvent paramMotionEvent)
    {
      return true;
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.calendarview.CalendarView.WeeksAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */