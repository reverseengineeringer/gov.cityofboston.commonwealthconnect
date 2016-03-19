package com.seeclickfix.ma.android.views.questions;

import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import com.seeclickfix.ma.android.objects.report.Answer;

class QuestionSelect$1
  implements AdapterView.OnItemSelectedListener
{
  QuestionSelect$1(QuestionSelect paramQuestionSelect) {}
  
  public void onItemSelected(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (!QuestionSelect.access$000(this$0))
    {
      paramAdapterView = (ArrayAdapter)paramAdapterView.getAdapter();
      this$0.answer = ((Answer)paramAdapterView.getItem(paramInt));
      this$0.answer.setSelectedPosition(paramInt);
      this$0.onSelectAnswer(this$0.answer);
      QuestionSelect.access$002(this$0, false);
    }
  }
  
  public void onNothingSelected(AdapterView<?> paramAdapterView)
  {
    if (!QuestionSelect.access$000(this$0))
    {
      paramAdapterView = (ArrayAdapter)paramAdapterView.getAdapter();
      this$0.answer = ((Answer)paramAdapterView.getItem(0));
      this$0.answer.setSelectedPosition(0);
      this$0.onSelectAnswer(this$0.answer);
      QuestionSelect.access$002(this$0, false);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.views.questions.QuestionSelect.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */