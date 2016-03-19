package com.seeclickfix.ma.android.views.questions;

import com.seeclickfix.ma.android.objects.report.Answer;

public abstract interface QuestionInterface
{
  public abstract Answer getAnswer();
  
  public abstract void setOnAnswerCallback(OnAnswerSetCallback paramOnAnswerSetCallback);
  
  public static abstract interface OnAnswerSetCallback
  {
    public abstract void onRemoveAnswer(Answer paramAnswer);
    
    public abstract void onSetAnswer(Answer paramAnswer);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionInterface
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */