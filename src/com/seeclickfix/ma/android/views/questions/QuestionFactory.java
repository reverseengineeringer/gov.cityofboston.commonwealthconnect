package com.seeclickfix.ma.android.views.questions;

import android.support.v4.app.FragmentActivity;
import android.view.ViewGroup;
import com.seeclickfix.ma.android.objects.report.Question;

public class QuestionFactory
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "QuestionFactory";
  
  public static QuestionInterface getQuestionWidget(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity)
  {
    String str = paramQuestion.getQuestionType();
    Object localObject = null;
    if (str.equals("number")) {
      paramQuestion = new QuestionNumber(paramQuestion, paramViewGroup, paramFragmentActivity, null);
    }
    do
    {
      return paramQuestion;
      if (str.equals("text")) {
        return new QuestionText(paramQuestion, paramViewGroup, paramFragmentActivity, null);
      }
      if (str.equals("textarea")) {
        return new QuestionTextArea(paramQuestion, paramViewGroup, paramFragmentActivity, null);
      }
      if (str.equals("note")) {
        return new QuestionNote(paramQuestion, paramViewGroup, paramFragmentActivity, null);
      }
      if (str.equals("select")) {
        return new QuestionSelect(paramQuestion, paramViewGroup, paramFragmentActivity, null);
      }
      if (str.equals("multivaluelist")) {
        return new QuestionMultivalue(paramQuestion, paramViewGroup, paramFragmentActivity, null);
      }
      if (str.equals("datetime")) {
        return new QuestionDatetime(paramQuestion, paramViewGroup, paramFragmentActivity, null);
      }
      paramQuestion = (Question)localObject;
    } while (!str.equals("hidden"));
    return null;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionFactory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */