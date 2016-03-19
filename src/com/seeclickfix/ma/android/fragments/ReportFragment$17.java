package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.widget.AdapterView;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog.ClickListener;
import com.seeclickfix.ma.android.objects.report.Answer;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import com.seeclickfix.ma.android.views.questions.QuestionInterface.OnAnswerSetCallback;

class ReportFragment$17
  implements QuestionInterface.OnAnswerSetCallback
{
  ReportFragment$17(ReportFragment paramReportFragment) {}
  
  public void onRemoveAnswer(Answer paramAnswer)
  {
    if (paramAnswer != null) {
      ReportFragment.access$200(this$0).removeAnswer(paramAnswer);
    }
  }
  
  public void onSetAnswer(Answer paramAnswer)
  {
    ReportFragment.access$200(this$0).addAnswer(paramAnswer);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.17
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */