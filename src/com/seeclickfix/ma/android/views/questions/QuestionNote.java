package com.seeclickfix.ma.android.views.questions;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.TextView;
import com.seeclickfix.ma.android.objects.report.Question;

public class QuestionNote
  extends AbstractQuestion
{
  public QuestionNote(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    super(paramQuestion, paramViewGroup, paramFragmentActivity, paramBundle);
    paramQuestion = (ViewGroup)paramFragmentActivity.getLayoutInflater().inflate(2130903114, null);
    container.addView(paramQuestion);
    paramViewGroup = question.getQuestionText();
    paramFragmentActivity = (TextView)paramQuestion.findViewById(2131362099);
    paramQuestion = paramViewGroup;
    if (paramViewGroup == null) {
      paramQuestion = getErrorString();
    }
    paramFragmentActivity.setText(paramQuestion);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionNote
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */