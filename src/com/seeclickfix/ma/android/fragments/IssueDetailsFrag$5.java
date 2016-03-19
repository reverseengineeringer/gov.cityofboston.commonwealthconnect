package com.seeclickfix.ma.android.fragments;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Comment;
import org.json.JSONArray;

class IssueDetailsFrag$5
  implements Response.Listener<JSONArray>
{
  IssueDetailsFrag$5(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Comment.class);
    this$0.showComments(paramJSONArray);
    this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */