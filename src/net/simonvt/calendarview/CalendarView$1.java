package net.simonvt.calendarview;

import android.database.DataSetObserver;
import java.util.Calendar;

class CalendarView$1
  extends DataSetObserver
{
  CalendarView$1(CalendarView paramCalendarView) {}
  
  public void onChanged()
  {
    if (CalendarView.access$600(this$0) != null)
    {
      Calendar localCalendar = CalendarView.access$700(this$0).getSelectedDay();
      CalendarView.access$600(this$0).onSelectedDayChange(this$0, localCalendar.get(1), localCalendar.get(2), localCalendar.get(5));
    }
  }
}

/* Location:
 * Qualified Name:     net.simonvt.calendarview.CalendarView.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */