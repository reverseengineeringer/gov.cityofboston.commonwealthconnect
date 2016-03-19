package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.widget.Adapter;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.objects.issue.Issue;
import com.seeclickfix.ma.android.objects.issue.Transition;

class IssueDetailsFrag$8
  implements AdapterView.OnItemSelectedListener
{
  String newStatus;
  
  IssueDetailsFrag$8(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public void onItemSelected(AdapterView<?> paramAdapterView, View paramView, int paramInt, long paramLong)
  {
    if (IssueDetailsFrag.access$000(this$0) == null) {}
    do
    {
      return;
      newStatus = ((String)paramAdapterView.getAdapter().getItem(paramInt));
    } while (("Archived".equals(IssueDetailsFrag.access$000(this$0).getStatus())) || (newStatus.equals(IssueDetailsFrag.access$000(this$0).getStatus())));
    OneTimeWarnDialog.statusChangeWarning(this$0, new Runnable()new Runnable
    {
      public void run()
      {
        IssueDetailsFrag.access$500(this$0, Transition.fromStatus(IssueDetailsFrag.access$000(this$0), newStatus));
      }
    }, new Runnable()
    {
      public void run()
      {
        this$0.resetStatus();
      }
    });
  }
  
  public void onNothingSelected(AdapterView<?> paramAdapterView) {}
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */