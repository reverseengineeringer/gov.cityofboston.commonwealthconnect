package com.seeclickfix.ma.android.views.questions;

import android.text.Editable;
import android.text.TextWatcher;
import android.widget.EditText;

class QuestionNumber$3
  implements TextWatcher
{
  QuestionNumber$3(QuestionNumber paramQuestionNumber) {}
  
  public void afterTextChanged(Editable paramEditable)
  {
    QuestionNumber.access$100(this$0).post(new Runnable()
    {
      public void run()
      {
        QuestionNumber.access$200(this$0);
      }
    });
  }
  
  public void beforeTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
  
  public void onTextChanged(CharSequence paramCharSequence, int paramInt1, int paramInt2, int paramInt3) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionNumber.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */