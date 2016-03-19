package com.seeclickfix.ma.android.fragments;

import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Issue;
import java.util.List;
import org.json.JSONArray;

class IssueDetailsFrag$1
  implements Response.Listener<JSONArray>
{
  IssueDetailsFrag$1(IssueDetailsFrag paramIssueDetailsFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    if (this$0.getSherlockActivity() == null) {
      return;
    }
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Issue.class);
    IssueDetailsFrag.access$002(this$0, (Issue)paramJSONArray.get(0));
    this$0.getArguments().putParcelable("issue_bundle", IssueDetailsFrag.access$000(this$0));
    IssueDetailsFrag.access$100(this$0);
    this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
    IssueDetailsFrag.access$200(this$0).findViewById(2131361919).setVisibility(8);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.IssueDetailsFrag.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */