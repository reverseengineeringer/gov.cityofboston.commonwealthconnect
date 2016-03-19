package com.seeclickfix.ma.android.views.questions;

import android.view.View;
import android.view.View.OnClickListener;
import android.widget.CheckBox;
import com.seeclickfix.ma.android.objects.report.Answer;
import java.util.Set;

class QuestionMultivalue$1
  implements View.OnClickListener
{
  QuestionMultivalue$1(QuestionMultivalue paramQuestionMultivalue) {}
  
  public void onClick(View paramView)
  {
    Answer localAnswer = (Answer)paramView.getTag();
    paramView = (CheckBox)paramView.findViewById(2131362145);
    paramView.toggle();
    if (paramView.isChecked())
    {
      QuestionMultivalue.access$000(this$0).add(localAnswer.getAnswer());
      this$0.setMultivalAnswer();
      this$0.onSelectAnswer(this$0.answer);
    }
    do
    {
      return;
      this$0.onRemovewAnswer(this$0.answer);
      QuestionMultivalue.access$000(this$0).remove(localAnswer.getAnswer());
    } while (QuestionMultivalue.access$000(this$0).size() <= 0);
    this$0.setMultivalAnswer();
    this$0.onSelectAnswer(this$0.answer);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionMultivalue.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */