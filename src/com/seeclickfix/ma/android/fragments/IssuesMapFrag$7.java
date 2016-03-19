package com.seeclickfix.ma.android.fragments;

import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.adapters.IssueListMapAdapter;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Issue;
import org.json.JSONArray;

class IssuesMapFrag$7
  implements Response.Listener<JSONArray>
{
  IssuesMapFrag$7(IssuesMapFrag paramIssuesMapFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    if (this$0.getSherlockActivity() == null) {
      return;
    }
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Issue.class);
    IssuesMapFrag.access$900(this$0).appendList(paramJSONArray);
    IssuesMapFrag.access$1000(this$0);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssuesMapFrag.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */