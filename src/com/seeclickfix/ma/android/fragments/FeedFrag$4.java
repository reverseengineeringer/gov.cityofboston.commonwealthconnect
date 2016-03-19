package com.seeclickfix.ma.android.fragments;

import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Issue;
import java.util.List;
import org.json.JSONArray;

class FeedFrag$4
  implements Response.Listener<JSONArray>
{
  FeedFrag$4(FeedFrag paramFeedFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Issue.class);
    this$0.addItemsToAdapter(paramJSONArray);
    if (paramJSONArray.isEmpty()) {
      this$0.postNoIssueItem();
    }
    FeedFrag.access$400(this$0);
    FeedFrag.access$102(this$0, false);
    this$0.setFragState(BaseFrag.FragState.ACTIVE);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */