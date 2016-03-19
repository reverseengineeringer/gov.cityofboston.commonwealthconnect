package com.seeclickfix.ma.android.fragments;

import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.adapters.FeedAdapter;
import com.seeclickfix.ma.android.fragments.base.BaseFrag.FragState;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.types.FeedItem;
import com.seeclickfix.ma.android.objects.zone.ZoneWrapper;
import java.util.List;
import org.json.JSONObject;

class FeedFrag$18
  implements Response.Listener<JSONObject>
{
  FeedFrag$18(FeedFrag paramFeedFrag) {}
  
  public void onResponse(JSONObject paramJSONObject)
  {
    if (this$0.getSherlockActivity() == null) {
      return;
    }
    this$0.setFragState(BaseFrag.FragState.ACTIVE);
    paramJSONObject = new DeserializeResponse().getJavaObject(paramJSONObject.toString(), ZoneWrapper.class);
    if (!paramJSONObject.isEmpty())
    {
      paramJSONObject = ((ZoneWrapper)paramJSONObject.get(0)).getWatchAreas();
      if (!paramJSONObject.isEmpty()) {
        FeedFrag.access$200(this$0).addFeedItemAt(0, (FeedItem)paramJSONObject.get(0));
      }
    }
    try
    {
      this$0.startLoading();
      return;
    }
    catch (Exception paramJSONObject) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.fragments.FeedFrag.18
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */