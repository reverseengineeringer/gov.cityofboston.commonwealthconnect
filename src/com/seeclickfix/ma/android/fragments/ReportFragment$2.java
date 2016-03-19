package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog;
import com.seeclickfix.ma.android.dialogs.OneTimeWarnDialog.ClickListener;

class ReportFragment$2
  implements View.OnClickListener
{
  ReportFragment$2(ReportFragment paramReportFragment) {}
  
  public void onClick(View paramView)
  {
    if ((ReportFragment.access$000(this$0)) && (this$0.shouldShowDialog("Pref:WARN_LOCATION_CHANGE")))
    {
      paramView = OneTimeWarnDialog.newInstance("Pref:WARN_LOCATION_CHANGE", 2131493106, 2131493105, 2131492944, 2130837727);
      paramView.setClickListener(new OneTimeWarnDialog.ClickListener()
      {
        public void onNegativeClick() {}
        
        public void onPositiveClick()
        {
          this$0.showMapFrag();
        }
      });
      paramView.show(this$0.getFragmentManager(), null);
      return;
    }
    this$0.showMapFrag();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */