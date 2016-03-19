package com.seeclickfix.ma.android.fragments;

import android.os.Bundle;
import android.os.Handler;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnCameraChangeListener;
import com.google.android.gms.maps.model.CameraPosition;

class IssuesMapFrag$10
  implements GoogleMap.OnCameraChangeListener
{
  IssuesMapFrag$10(IssuesMapFrag paramIssuesMapFrag) {}
  
  public void onCameraChange(CameraPosition paramCameraPosition)
  {
    IssuesMapFrag.access$1100(this$0).setOnCameraChangeListener(null);
    this$0.getArguments().putParcelable("cam_position", paramCameraPosition);
    IssuesMapFrag.access$1302(this$0, true);
    IssuesMapFrag.access$002(this$0, paramCameraPosition);
    IssuesMapFrag.access$1400(this$0).postDelayed(this$0.reloadDelay, 20L);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */