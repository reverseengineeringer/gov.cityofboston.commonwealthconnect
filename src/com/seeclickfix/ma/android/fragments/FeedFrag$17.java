package com.seeclickfix.ma.android.fragments;

import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.adapters.FeedAdapter;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.types.FeedItem;
import com.seeclickfix.ma.android.objects.zone.EnhancedWatchAreas;
import java.util.List;
import org.json.JSONObject;

class FeedFrag$17
  implements Response.Listener<JSONObject>
{
  FeedFrag$17(FeedFrag paramFeedFrag) {}
  
  public void onResponse(JSONObject paramJSONObject)
  {
    if (this$0.getActivity() == null) {
      return;
    }
    this$0.setFragState(BaseFrag.FragState.ACTIVE);
    paramJSONObject = new DeserializeResponse().getJavaObject(paramJSONObject.toString(), EnhancedWatchAreas.class);
    FeedFrag.access$200(this$0).addFeedItemAt(0, (FeedItem)paramJSONObject.get(0));
    this$0.startLoading();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.17
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */