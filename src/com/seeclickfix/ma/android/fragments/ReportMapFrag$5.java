package com.seeclickfix.ma.android.fragments;

import android.location.Address;
import com.google.android.gms.maps.model.Marker;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.location.AddressLocalizer;

class ReportMapFrag$5
  extends SimpleListener<Address>
{
  ReportMapFrag$5(ReportMapFrag paramReportMapFrag) {}
  
  public void onFailure(SimpleListener.Code paramCode)
  {
    ReportMapFrag.access$100(this$0).setTitle(this$0.getString(2131493123));
    ReportMapFrag.access$100(this$0).showInfoWindow();
  }
  
  public void onSuccess(Address paramAddress)
  {
    if (ReportMapFrag.access$100(this$0) != null)
    {
      paramAddress = AddressLocalizer.getAddressString(paramAddress);
      ReportMapFrag.access$100(this$0).setTitle(paramAddress);
      ReportMapFrag.access$100(this$0).showInfoWindow();
      ReportMapFrag.access$200(this$0, ReportMapFrag.access$100(this$0).getPosition());
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportMapFrag.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */