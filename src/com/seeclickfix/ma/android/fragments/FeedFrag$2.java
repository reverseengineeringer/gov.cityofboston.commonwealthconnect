package com.seeclickfix.ma.android.fragments;

import android.os.Handler;
import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.adapters.FeedAdapter;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Issue;
import java.util.List;
import org.json.JSONArray;

class FeedFrag$2
  implements Response.Listener<JSONArray>
{
  FeedFrag$2(FeedFrag paramFeedFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Issue.class);
    if (paramJSONArray.isEmpty())
    {
      FeedFrag.access$002(this$0, true);
      FeedFrag.access$102(this$0, false);
      this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
      return;
    }
    FeedFrag.access$200(this$0).setOnScrollListener(null);
    FeedFrag.access$200(this$0).appendList(paramJSONArray);
    FeedFrag.access$200(this$0).notifyDataSetChanged();
    FeedFrag.access$102(this$0, false);
    this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
    FeedFrag.access$300(this$0).postDelayed(this$0.resetScrollListener, 1000L);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */