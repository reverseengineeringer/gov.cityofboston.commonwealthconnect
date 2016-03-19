package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnFocusChangeListener;

class ReportFragment$19
  implements View.OnFocusChangeListener
{
  ReportFragment$19(ReportFragment paramReportFragment) {}
  
  public void onFocusChange(View paramView, boolean paramBoolean)
  {
    if ((paramView.getId() == 2131362032) && (paramBoolean)) {
      this$0.editAddress();
    }
    while ((paramView.getId() != 2131362032) || (paramBoolean)) {
      return;
    }
    this$0.handleAddressEdit();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.19
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */