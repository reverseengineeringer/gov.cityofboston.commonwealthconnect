package com.seeclickfix.ma.android.views.questions;

import android.widget.EditText;
import com.seeclickfix.ma.android.dialogs.NumDialog;
import com.seeclickfix.ma.android.dialogs.NumDialog.OnNumCompleteListener;

class QuestionNumber$2
  implements NumDialog.OnNumCompleteListener
{
  QuestionNumber$2(QuestionNumber paramQuestionNumber) {}
  
  public void onComplete(NumDialog paramNumDialog)
  {
    QuestionNumber.access$100(this$0).setText(String.valueOf(paramNumDialog.getValue()));
    QuestionNumber.access$200(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionNumber.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */