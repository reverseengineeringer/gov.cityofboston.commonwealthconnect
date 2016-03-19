package com.seeclickfix.ma.android.fragments;

import android.location.Address;
import com.google.android.gms.maps.model.Marker;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener;
import com.seeclickfix.ma.android.fragments.interfaces.SimpleListener.Code;
import com.seeclickfix.ma.android.location.AddressLocalizer;

class PlacesMapFrag$4
  extends SimpleListener<Address>
{
  PlacesMapFrag$4(PlacesMapFrag paramPlacesMapFrag) {}
  
  public void onFailure(SimpleListener.Code paramCode) {}
  
  public void onSuccess(Address paramAddress)
  {
    if (PlacesMapFrag.access$100(this$0) != null)
    {
      paramAddress = AddressLocalizer.getAddressString(paramAddress);
      PlacesMapFrag.access$100(this$0).setTitle(paramAddress);
      PlacesMapFrag.access$100(this$0).showInfoWindow();
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.PlacesMapFrag.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */