package com.seeclickfix.ma.android.views.questions;

import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;

class QuestionText$1
  implements TextWatcher
{
  QuestionText$1(QuestionText paramQuestionText) {}
  
  public void afterTextChanged(Editable paramEditable)
  {
    this$0.questionEditText.post(new Runnable()
    {
      public void run()
      {
        this$0.updateAnswer();
      }
    });
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionText.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */