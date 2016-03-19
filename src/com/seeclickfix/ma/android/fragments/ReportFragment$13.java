package com.seeclickfix.ma.android.fragments;

import android.location.Address;
import com.seeclickfix.ma.android.dialogs.ErrorDialog;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;

class ReportFragment$13
  extends SimpleListener<Address>
{
  ReportFragment$13(ReportFragment paramReportFragment, Runnable paramRunnable) {}
  
  public void onFailure(SimpleListener.Code paramCode)
  {
    this$0.setFragState(BaseFrag.FragState.ERROR);
    ReportFragment.access$900(this$0).showErrorPanel(2131492980, 2131492971, 2130837778, 2131492978, new Runnable()
    {
      public void run()
      {
        ReportFragment.access$800(this$0, val$callback);
      }
    });
  }
  
  public void onSuccess(Address paramAddress)
  {
    this$0.showGeocodedAddress(paramAddress);
    if (val$callback != null) {
      val$callback.run();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.13
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */