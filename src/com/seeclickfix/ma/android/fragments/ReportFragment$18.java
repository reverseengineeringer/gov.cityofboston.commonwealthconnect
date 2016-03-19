package com.seeclickfix.ma.android.fragments;

import android.content.Intent;
import android.net.Uri;
import android.support.v4.app.FragmentActivity;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog.ClickListener;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestType;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;
import org.apache.commons.lang3.StringUtils;

class ReportFragment$18
  implements AdapterView.OnItemSelectedListener
{
  ReportFragment$18(ReportFragment paramReportFragment) {}
  
  public void onItemSelected(final AdapterView<?> paramAdapterView, final View paramView, int paramInt, long paramLong)
  {
    if (paramInt <= 0)
    {
      onNothingSelected(paramAdapterView);
      return;
    }
    final Object localObject1 = (RequestType)paramView.getTag();
    if (StringUtils.isNotEmpty(((RequestType)localObject1).getAction()))
    {
      paramAdapterView.setSelection(((RequestWatchArea)paramAdapterView.getTag()).getSelectedPosition());
      paramAdapterView = new Intent("android.intent.action.DIAL");
      paramAdapterView.setData(Uri.parse(((RequestType)localObject1).getActionData()));
      this$0.getActivity().startActivity(paramAdapterView);
      return;
    }
    if (ReportFragment.access$1000(this$0) != null)
    {
      localObject1 = (RequestWatchArea)paramAdapterView.getTag();
      ((RequestWatchArea)localObject1).setReport(ReportFragment.access$200(this$0));
      if (this$0.isRequestTypeSwitch(paramView, (RequestWatchArea)localObject1))
      {
        if (this$0.shouldShowDialog("Pref:warn_watch_area"))
        {
          localObject2 = OneTimeWarnDialog.newInstance("Pref:warn_watch_area", 2131493104, 2131493103, 2131492944, 2130837727);
          ((OneTimeWarnDialog)localObject2).setClickListener(new OneTimeWarnDialog.ClickListener()
          {
            public void onNegativeClick()
            {
              int i = localObject1.getSelectedPosition();
              paramAdapterView.setSelection(i);
            }
            
            public void onPositiveClick()
            {
              this$0.showFollowupRow(true);
              ReportFragment.access$1002(this$0, localObject1);
              ReportFragment.access$200(this$0).setSelectedWatchAreaApiId(ReportFragment.access$1000(this$0).getId());
              this$0.setRequestTypeByView(paramView, paramAdapterView);
            }
          });
          ((OneTimeWarnDialog)localObject2).show(this$0.getFragmentManager(), null);
          return;
        }
        this$0.setRequestTypeByView(paramView, paramAdapterView);
        return;
      }
      this$0.showFollowupQuestions(ReportFragment.access$200(this$0).getQuestions(), ReportFragment.access$1000(this$0));
      return;
    }
    Object localObject2 = (RequestWatchArea)paramAdapterView.getTag();
    ((RequestWatchArea)localObject2).setReport(ReportFragment.access$200(this$0));
    ReportFragment.access$1002(this$0, (RequestWatchArea)localObject2);
    ReportFragment.access$200(this$0).setSelectedWatchAreaApiId(ReportFragment.access$1000(this$0).getId());
    if (((RequestType)localObject1).getApiId().equals(ReportFragment.access$200(this$0).getRequestTypeId()))
    {
      this$0.showFollowupQuestions(ReportFragment.access$200(this$0).getQuestions(), ReportFragment.access$1000(this$0));
      ReportFragment.access$200(this$0).setRequestType((RequestType)localObject1);
      return;
    }
    this$0.setRequestTypeByView(paramView, paramAdapterView);
  }
  
  public void onNothingSelected(AdapterView<?> paramAdapterView)
  {
    RequestWatchArea localRequestWatchArea = (RequestWatchArea)paramAdapterView.getTag();
    if (localRequestWatchArea.getIsFromDraft()) {
      paramAdapterView.setSelection(localRequestWatchArea.getSelectedPosition());
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.18
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */