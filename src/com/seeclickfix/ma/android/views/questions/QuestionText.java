package com.seeclickfix.ma.android.views.questions;

import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import com.alostpacket.pajamalib.utils.ViewUtil;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Question;

public class QuestionText
  extends AbstractQuestion
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "QuestionText";
  private boolean isRecreatingAPreviousAnswer = false;
  protected EditText questionEditText;
  private TextWatcher textWatcher;
  
  public QuestionText(Question paramQuestion, ViewGroup paramViewGroup, FragmentActivity paramFragmentActivity, Bundle paramBundle)
  {
    super(paramQuestion, paramViewGroup, paramFragmentActivity, paramBundle);
    setupListeners();
    setupQuestion();
  }
  
  private void showPreviousAnswer(Answer paramAnswer)
  {
    questionEditText.setText(paramAnswer.getAnswer());
    isRecreatingAPreviousAnswer = false;
  }
  
  protected void setupListeners()
  {
    textWatcher = new TextWatcher()
    {
      public void afterTextChanged(Editable paramAnonymousEditable)
      {
        questionEditText.post(new Runnable()
        {
          public void run()
          {
            updateAnswer();
          }
        });
      }
      
      public void beforeTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
      
      public void onTextChanged(CharSequence paramAnonymousCharSequence, int paramAnonymousInt1, int paramAnonymousInt2, int paramAnonymousInt3) {}
    };
  }
  
  protected void setupQuestion()
  {
    ViewGroup localViewGroup = (ViewGroup)ViewUtil.inflate(container.getContext(), 2130903117, container);
    TextView localTextView = (TextView)localViewGroup.findViewById(2131362105);
    questionEditText = ((EditText)localViewGroup.findViewById(2131362106));
    if (question.getQuestionText() == null) {}
    for (Object localObject = getErrorString();; localObject = question.getQuestionText())
    {
      setQuestionText((String)localObject, localTextView);
      localObject = question.getSelectedAnswer();
      if (localObject != null)
      {
        isRecreatingAPreviousAnswer = true;
        showPreviousAnswer((Answer)localObject);
      }
      questionEditText.setImeActionLabel(activity.getString(2131493127), 726);
      questionEditText.addTextChangedListener(textWatcher);
      container.addView(localViewGroup);
      return;
    }
  }
  
  protected void updateAnswer()
  {
    if (!isRecreatingAPreviousAnswer)
    {
      if (answer == null)
      {
        answer = new Answer();
        answer.setPrimaryKey(question.getPrimaryKey());
        answer.setDisplayText(question.getQuestionText());
      }
      String str = questionEditText.getText().toString();
      answer.setAnswer(str);
      question.setSelectedAnswer(answer);
      onSelectAnswer(answer);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionText
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */