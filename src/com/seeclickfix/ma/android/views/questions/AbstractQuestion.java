package com.seeclickfix.ma.android.views.questions;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.view.ViewGroup;
import android.widget.TextView;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.style.StyleUtil;

public abstract class AbstractQuestion
  implements QuestionInterface
{
  protected FragmentActivity activity;
  protected Answer answer;
  protected QuestionInterface.OnAnswerSetCallback callback;
  protected ViewGroup container;
  protected Question question;
  protected Bundle savedInstance;
  
  public AbstractQuestion(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    question = paramQuestion;
    container = paramViewGroup;
    activity = paramFragmentActivity;
    savedInstance = paramBundle;
  }
  
  protected void appendRequiredString(String paramString, TextView paramTextView)
  {
    StyleUtil.appendRequiredString(paramString, paramTextView, activity);
  }
  
  public Answer getAnswer()
  {
    return answer;
  }
  
  protected String getErrorString()
  {
    return activity.getString(2131493082);
  }
  
  protected ViewGroup getQuestionContainer()
  {
    return null;
  }
  
  protected String getType()
  {
    return question.getQuestionType();
  }
  
  protected void onRemovewAnswer(Answer paramAnswer)
  {
    if (callback != null) {
      callback.onRemoveAnswer(paramAnswer);
    }
  }
  
  protected void onSelectAnswer(Answer paramAnswer)
  {
    if (callback != null) {
      callback.onSetAnswer(paramAnswer);
    }
  }
  
  public void setOnAnswerCallback(QuestionInterface.OnAnswerSetCallback paramOnAnswerSetCallback)
  {
    callback = paramOnAnswerSetCallback;
  }
  
  protected void setQuestionText(String paramString, TextView paramTextView)
  {
    if (question.isRequired())
    {
      if (!question.willDisplayAnswer())
      {
        StyleUtil.appendReqAndNotPub(paramString, paramTextView, activity);
        return;
      }
      appendRequiredString(paramString, paramTextView);
      return;
    }
    if (!question.willDisplayAnswer())
    {
      StyleUtil.appendNotPublicString(paramString, paramTextView, activity);
      return;
    }
    paramTextView.setText(paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.AbstractQuestion
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */