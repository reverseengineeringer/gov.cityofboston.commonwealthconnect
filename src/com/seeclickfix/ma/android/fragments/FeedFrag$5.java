package com.seeclickfix.ma.android.fragments;

import com.actionbarsherlock.app.SherlockFragmentActivity;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.adapters.FeedAdapter;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.issue.Comment;
import java.util.List;
import org.json.JSONArray;

class FeedFrag$5
  implements Response.Listener<JSONArray>
{
  FeedFrag$5(FeedFrag paramFeedFrag) {}
  
  public void onResponse(JSONArray paramJSONArray)
  {
    paramJSONArray = new DeserializeResponse().getJavaObject(paramJSONArray.toString(), Comment.class);
    if (paramJSONArray.isEmpty())
    {
      if (FeedFrag.access$200(this$0).getCommentCount() == 0) {
        this$0.postNoCommentsItem();
      }
      FeedFrag.access$502(this$0, true);
    }
    for (;;)
    {
      FeedFrag.access$200(this$0).setIsCommentList(true);
      this$0.getSherlockActivity().setSupportProgressBarIndeterminateVisibility(false);
      FeedFrag.access$102(this$0, false);
      this$0.setFragState(BaseFrag.FragState.ACTIVE);
      FeedFrag.access$400(this$0);
      return;
      FeedFrag.access$200(this$0).appendCommentsToList(paramJSONArray);
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */