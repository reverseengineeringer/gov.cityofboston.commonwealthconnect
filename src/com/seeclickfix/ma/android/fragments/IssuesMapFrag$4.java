package com.seeclickfix.ma.android.fragments;

import android.support.v4.app.FragmentActivity;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.seeclickfix.ma.android.tasks.GetIssuesMapTask;

class IssuesMapFrag$4
  implements Runnable
{
  IssuesMapFrag$4(IssuesMapFrag paramIssuesMapFrag) {}
  
  public void run()
  {
    if (this$0.getSherlockActivity() == null) {
      return;
    }
    this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(true);
    CameraPosition localCameraPosition = IssuesMapFrag.access$000(this$0);
    IssuesMapFrag.access$102(this$0, 4);
    IssuesMapFrag.access$602(this$0, new GetIssuesMapTask(this$0.getActivity().getApplicationContext(), IssuesMapFrag.access$300(this$0), this$0.reloadListener, this$0.errorListener, target.latitude, target.longitude, zoom, IssuesMapFrag.access$100(this$0)));
    IssuesMapFrag.access$600(this$0).execute();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */