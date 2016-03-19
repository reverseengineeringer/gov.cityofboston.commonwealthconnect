package com.seeclickfix.ma.android.views.questions;

import android.support.v4.app.FragmentActivity;
import android.widget.TextView;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import com.seeclickfix.ma.android.dialogs.CalendarDialog.OnCalendarSetListener;
import java.util.Date;

class QuestionDatetime$3
  implements CalendarDialog.OnCalendarSetListener
{
  QuestionDatetime$3(QuestionDatetime paramQuestionDatetime) {}
  
  public void onDateSet(long paramLong)
  {
    QuestionDatetime.access$202(this$0, paramLong);
    LocaleManager.getLocale(this$0.activity.getApplicationContext());
    java.text.DateFormat localDateFormat = android.text.format.DateFormat.getDateFormat(this$0.activity);
    QuestionDatetime.access$302(this$0, localDateFormat.format(new Date(paramLong)));
    QuestionDatetime.access$400(this$0).setText(QuestionDatetime.access$300(this$0));
    this$0.attemptAnswer();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionDatetime.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */