package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.List;

class ReportFragment$15
  extends SimpleListener<List<RequestWatchArea>>
{
  ReportFragment$15(ReportFragment paramReportFragment, Runnable paramRunnable) {}
  
  public void onFailure(SimpleListener.Code paramCode)
  {
    this$0.setFragState(BaseFrag.FragState.ERROR);
    ReportFragment.access$900(this$0).showErrorPanel(2131492980, 2131492971, 2130837778, 2131492978, new Runnable()
    {
      public void run()
      {
        ReportFragment.access$700(this$0, val$runner);
      }
    });
  }
  
  public void onSuccess(List<RequestWatchArea> paramList)
  {
    this$0.showZones(paramList);
    this$0.showDescriptionAndSummary();
    if (val$runner != null) {
      val$runner.run();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */