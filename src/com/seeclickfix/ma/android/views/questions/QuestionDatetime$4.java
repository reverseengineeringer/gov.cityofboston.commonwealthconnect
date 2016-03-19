package com.seeclickfix.ma.android.views.questions;

import android.support.v4.app.FragmentActivity;
import android.text.format.DateFormat;
import android.widget.TextView;
import com.seeclickfix.ma.android.dialogs.TimeDialog.OnTimeValueSetListener;
import java.util.Calendar;

class QuestionDatetime$4
  implements TimeDialog.OnTimeValueSetListener
{
  private boolean mIs24Time;
  
  QuestionDatetime$4(QuestionDatetime paramQuestionDatetime) {}
  
  public void onTimeSet(Calendar paramCalendar)
  {
    mIs24Time = DateFormat.is24HourFormat(this$0.activity.getApplicationContext());
    if (mIs24Time) {
      QuestionDatetime.access$502(this$0, (String)DateFormat.format("k:mm", paramCalendar));
    }
    for (;;)
    {
      QuestionDatetime.access$600(this$0).setText(QuestionDatetime.access$500(this$0));
      this$0.attemptAnswer();
      return;
      QuestionDatetime.access$502(this$0, (String)DateFormat.format("h:mm A", paramCalendar));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionDatetime.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */