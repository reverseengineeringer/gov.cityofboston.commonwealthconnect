package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.widget.AdapterView;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog.ClickListener;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.objects.report.RequestWatchArea;

class ReportFragment$17$1
  implements OneTimeWarnDialog.ClickListener
{
  ReportFragment$17$1(ReportFragment.17 param17, RequestWatchArea paramRequestWatchArea, View paramView, AdapterView paramAdapterView) {}
  
  public void onNegativeClick()
  {
    int i = val$newArea.getSelectedPosition();
    val$parent.setSelection(i);
  }
  
  public void onPositiveClick()
  {
    this$1.this$0.showFollowupRow(true);
    ReportFragment.access$1002(this$1.this$0, val$newArea);
    ReportFragment.access$200(this$1.this$0).setSelectedWatchAreaApiId(ReportFragment.access$1000(this$1.this$0).getId());
    this$1.this$0.setRequestTypeByView(val$view, val$parent);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.17.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */