package com.seeclickfix.ma.android.fragments;

import android.view.View;
import android.view.View.OnClickListener;
import java.io.IOException;

class ReportFragment$1
  implements View.OnClickListener
{
  ReportFragment$1(ReportFragment paramReportFragment) {}
  
  public void onClick(View paramView)
  {
    try
    {
      this$0.launchCameraIntent();
      return;
    }
    catch (IOException paramView) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */