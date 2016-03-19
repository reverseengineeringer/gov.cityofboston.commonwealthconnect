package com.seeclickfix.ma.android.fragments;

import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.location.SimpleLocation;
import java.util.ArrayList;
import java.util.List;

class ReportFragment$14
  extends SimpleListener<List<SimpleLocation>>
{
  ReportFragment$14(ReportFragment paramReportFragment) {}
  
  public void onFailure(SimpleListener.Code paramCode)
  {
    this$0.setFragState(BaseFrag.FragState.ACTIVE);
    this$0.processSimpleLocations(new ArrayList());
  }
  
  public void onSuccess(List<SimpleLocation> paramList)
  {
    this$0.setFragState(BaseFrag.FragState.ACTIVE);
    this$0.processSimpleLocations(paramList);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.14
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */