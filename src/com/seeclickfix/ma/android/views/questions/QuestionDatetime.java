package com.seeclickfix.ma.android.views.questions;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.config.locale.LocaleManager;
import com.seeclickfix.ma.android.dialogs.CalendarDialog;
import com.seeclickfix.ma.android.dialogs.CalendarDialog.OnCalendarSetListener;
import com.seeclickfix.ma.android.dialogs.TimeDialog;
import com.seeclickfix.ma.android.dialogs.TimeDialog.OnTimeValueSetListener;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import java.util.Calendar;
import java.util.Date;

public class QuestionDatetime
  extends AbstractQuestion
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "QuestionDatetime";
  private CalendarDialog calDialog;
  private CalendarDialog.OnCalendarSetListener calDialogListener = new CalendarDialog.OnCalendarSetListener()
  {
    public void onDateSet(long paramAnonymousLong)
    {
      QuestionDatetime.access$202(QuestionDatetime.this, paramAnonymousLong);
      LocaleManager.getLocale(activity.getApplicationContext());
      java.text.DateFormat localDateFormat = android.text.format.DateFormat.getDateFormat(activity);
      QuestionDatetime.access$302(QuestionDatetime.this, localDateFormat.format(new Date(paramAnonymousLong)));
      dateSelectionTextView.setText(formattedDate);
      attemptAnswer();
    }
  };
  private long dateMilliseconds;
  View.OnClickListener dateQuestionBtnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      QuestionDatetime.this.showCalendarDialog();
    }
  };
  private TextView dateSelectionTextView;
  private String formattedDate;
  private String formattedTime;
  private TimeDialog timeDialog;
  View.OnClickListener timeQuestionBtnListener = new View.OnClickListener()
  {
    public void onClick(View paramAnonymousView)
    {
      QuestionDatetime.this.showTimeDialog();
    }
  };
  private TextView timeSelectionTextView;
  private TimeDialog.OnTimeValueSetListener timeSetListener = new TimeDialog.OnTimeValueSetListener()
  {
    private boolean mIs24Time;
    
    public void onTimeSet(Calendar paramAnonymousCalendar)
    {
      mIs24Time = android.text.format.DateFormat.is24HourFormat(activity.getApplicationContext());
      if (mIs24Time) {
        QuestionDatetime.access$502(QuestionDatetime.this, (String)android.text.format.DateFormat.format("k:mm", paramAnonymousCalendar));
      }
      for (;;)
      {
        timeSelectionTextView.setText(formattedTime);
        attemptAnswer();
        return;
        QuestionDatetime.access$502(QuestionDatetime.this, (String)android.text.format.DateFormat.format("h:mm A", paramAnonymousCalendar));
      }
    }
  };
  
  public QuestionDatetime(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    super(paramQuestion, paramViewGroup, paramFragmentActivity, paramBundle);
    paramQuestion = getContextgetResourcesgetConfigurationlocale;
    setupQuestion();
  }
  
  private void setupQuestion()
  {
    ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(container.getContext(), 2130903112, container);
    TextView localTextView = (TextView)localViewGroup.findViewById(2131362092);
    Button localButton1 = (Button)localViewGroup.findViewById(2131362094);
    Button localButton2 = (Button)localViewGroup.findViewById(2131362096);
    dateSelectionTextView = ((TextView)localViewGroup.findViewById(2131362093));
    timeSelectionTextView = ((TextView)localViewGroup.findViewById(2131362095));
    if (question.getQuestionText() == null) {}
    for (String str = getErrorString();; str = question.getQuestionText())
    {
      setQuestionText(str, localTextView);
      localButton1.setTag(question);
      localButton1.setOnClickListener(dateQuestionBtnListener);
      localButton2.setTag(question);
      localButton2.setOnClickListener(timeQuestionBtnListener);
      showSavedValues();
      container.addView(localViewGroup);
      return;
    }
  }
  
  private void showCalendarDialog()
  {
    if (calDialog == null) {}
    for (CalendarDialog localCalendarDialog = new CalendarDialog();; localCalendarDialog = calDialog)
    {
      calDialog = localCalendarDialog;
      calDialog.setPreviousDate(dateMilliseconds);
      calDialog.setDateSelectedListener(calDialogListener);
      calDialog.show(activity.getSupportFragmentManager(), "CalendarDialog" + question.getPrimaryKey());
      return;
    }
  }
  
  private void showSavedValues()
  {
    Answer localAnswer = question.getSelectedAnswer();
    if (localAnswer != null)
    {
      dateMilliseconds = localAnswer.getDate();
      formattedDate = ((String)android.text.format.DateFormat.format("MMMM dd, yyyy", localAnswer.getDate()));
      formattedTime = localAnswer.getTime();
      dateSelectionTextView.setText(formattedDate);
      timeSelectionTextView.setText(formattedTime);
    }
  }
  
  private void showTimeDialog()
  {
    if (timeDialog == null) {}
    for (TimeDialog localTimeDialog = TimeDialog.newInstance(activity.getApplicationContext());; localTimeDialog = timeDialog)
    {
      timeDialog = localTimeDialog;
      timeDialog.setPreviousTime(formattedTime);
      timeDialog.setOnTimeValueSetListener(timeSetListener);
      timeDialog.show(activity.getSupportFragmentManager(), "TimeDialog" + question.getPrimaryKey());
      return;
    }
  }
  
  protected void attemptAnswer()
  {
    if ((formattedDate != null) && (formattedTime != null))
    {
      if (answer == null)
      {
        answer = new Answer();
        answer.setPrimaryKey(question.getPrimaryKey());
      }
      answer.setTime(formattedTime);
      answer.setDate(dateMilliseconds);
      answer.setAnswer(formattedDate + " " + formattedTime);
      question.setSelectedAnswer(answer);
      onSelectAnswer(answer);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionDatetime
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */