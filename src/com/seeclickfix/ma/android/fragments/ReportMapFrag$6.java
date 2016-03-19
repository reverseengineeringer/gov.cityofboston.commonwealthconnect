package com.seeclickfix.ma.android.fragments;

import android.location.Address;
import android.os.Handler;
import com.seeclickfix.ma.android.fragments.base.BaseFrag;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.SimpleState;

class ReportMapFrag$6
  extends SafeListener<Address>
{
  ReportMapFrag$6(ReportMapFrag paramReportMapFrag, BaseFrag paramBaseFrag, SimpleListener paramSimpleListener)
  {
    super(paramBaseFrag, paramSimpleListener);
  }
  
  public void onStateChange(SimpleListener.SimpleState paramSimpleState, boolean paramBoolean)
  {
    if (paramSimpleState == SimpleListener.SimpleState.FINISHED) {
      ReportMapFrag.access$400(this$0).removeCallbacks(ReportMapFrag.access$300(this$0));
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportMapFrag.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */