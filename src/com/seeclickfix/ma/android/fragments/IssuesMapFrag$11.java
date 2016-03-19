package com.seeclickfix.ma.android.fragments;

import android.os.Bundle;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;

class IssuesMapFrag$11
  implements GoogleMap.OnMapClickListener
{
  IssuesMapFrag$11(IssuesMapFrag paramIssuesMapFrag) {}
  
  public void onMapClick(LatLng paramLatLng)
  {
    if (IssuesMapFrag.access$1500() != null)
    {
      IssuesMapFrag.access$1500().hideInfoWindow();
      IssuesMapFrag.access$1502(null);
      this$0.getArguments().putInt("issue_id", -1);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag.11
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */