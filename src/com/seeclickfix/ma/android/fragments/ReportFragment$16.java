package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.objects.report.Question;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import java.util.List;
import retrofit.Callback;
import retrofit.RetrofitError;
import retrofit.client.Response;

class ReportFragment$16
  implements Callback<List<Question>>
{
  ReportFragment$16(ReportFragment paramReportFragment, RequestWatchArea paramRequestWatchArea, Runnable paramRunnable, String paramString) {}
  
  public void failure(RetrofitError paramRetrofitError)
  {
    if (this$0.getActivity() != null)
    {
      this$0.setFragState(BaseFrag.FragState.ERROR);
      ReportFragment.access$900(this$0).showErrorPanel(2131492980, 2131492971, 2130837778, 2131492978, new Runnable()
      {
        public void run()
        {
          this$0.getFollowupQuestions(val$watchArea, val$reqId, val$runner);
        }
      });
    }
  }
  
  public void success(List<Question> paramList, Response paramResponse)
  {
    if (this$0.getActivity() != null)
    {
      this$0.showFollowupQuestions(paramList, val$watchArea);
      ReportFragment.access$200(this$0).setQuestions(paramList);
      if (val$runner != null) {
        val$runner.run();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.16
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */