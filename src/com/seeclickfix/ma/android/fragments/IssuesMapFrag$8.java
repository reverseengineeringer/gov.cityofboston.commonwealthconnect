package com.seeclickfix.ma.android.fragments;

import com.android.volley.Response.Listener;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.Projection;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.VisibleRegion;
import com.seeclickfix.ma.android.adapters.IssueListMapAdapter;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Issue;
import org.json.JSONArray;

class IssuesMapFrag$8
  implements Response.Listener<JSONArray>
{
  IssuesMapFrag$8(IssuesMapFrag paramIssuesMapFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    if (this$0.getSherlockActivity() == null) {
      return;
    }
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Issue.class);
    LatLngBounds localLatLngBounds = access$1100this$0).getProjection().getVisibleRegion().latLngBounds;
    IssuesMapFrag.access$900(this$0).appendList(paramJSONArray);
    IssuesMapFrag.access$900(this$0).pruneByBounds(localLatLngBounds);
    IssuesMapFrag.access$1200(this$0, localLatLngBounds);
    IssuesMapFrag.access$1000(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */