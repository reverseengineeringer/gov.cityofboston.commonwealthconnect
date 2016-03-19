package com.seeclickfix.ma.android.fragments;

import android.location.Location;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.seeclickfix.ma.android.location.LocationAdapter;
import com.seeclickfix.ma.android.objects.report.Report;
import com.seeclickfix.ma.android.views.ColorMarkers;

class ReportFragment$9
  implements CompoundButton.OnCheckedChangeListener
{
  ReportFragment$9(ReportFragment paramReportFragment) {}
  
  public void onCheckedChanged(CompoundButton paramCompoundButton, boolean paramBoolean)
  {
    ReportFragment.access$200(this$0).setIsUsingCurrentLocation(paramBoolean);
    if (paramBoolean)
    {
      paramCompoundButton = this$0.locationAdapter.getLastLocationIfAvailable();
      if (paramCompoundButton == null) {
        break label190;
      }
      ReportFragment.access$302(this$0, new LatLng(paramCompoundButton.getLatitude(), paramCompoundButton.getLongitude()));
    }
    for (;;)
    {
      ReportFragment.access$200(this$0).setLatLng(ReportFragment.access$300(this$0));
      ReportFragment.access$200(this$0).setLatLngModified(true);
      paramCompoundButton = CameraUpdateFactory.newLatLngZoom(ReportFragment.access$300(this$0), 16.0F);
      ReportFragment.access$400(this$0).animateCamera(paramCompoundButton, 500, null);
      ReportFragment.access$400(this$0).clear();
      ReportFragment.access$400(this$0).addMarker(new MarkerOptions().position(ReportFragment.access$300(this$0)).icon(ColorMarkers.getPinByStatus("Open", this$0.getAppContext())));
      ReportFragment.access$502(this$0, false);
      ReportFragment.access$600(this$0);
      ReportFragment.access$200(this$0).setModified(false);
      return;
      label190:
      ReportFragment.access$302(this$0, access$400this$0).getCameraPosition().target);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.ReportFragment.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */