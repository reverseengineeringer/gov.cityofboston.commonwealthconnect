package com.seeclickfix.ma.android.fragments;

import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import com.seeclickfix.ma.android.util.FormUtil;

class ReportFragment$6
  implements View.OnTouchListener
{
  ReportFragment$6(ReportFragment paramReportFragment) {}
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    FormUtil.hideKeyboard(paramView);
    if (ReportFragment.access$100(this$0))
    {
      this$0.handleAddressEdit();
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */