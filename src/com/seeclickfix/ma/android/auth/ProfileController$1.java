package com.seeclickfix.ma.android.auth;

import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.events.UserProfileLoadedEvent;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.objects.user.User;
import com.squareup.otto.Bus;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONObject;

class ProfileController$1
  implements Response.Listener<JSONObject>
{
  ProfileController$1(ProfileController paramProfileController) {}
  
  public void onResponse(JSONObject paramJSONObject)
  {
    ArrayList localArrayList = new DeserializeResponse().getJavaObject(paramJSONObject.toString(), User.class);
    ProfileController.access$002(this$0, (User)localArrayList.get(0));
    try
    {
      MyApplication.getEventBus().post(new UserProfileLoadedEvent(ProfileController.access$000(this$0)));
      PrefsUtil.putString("user_profile_json", paramJSONObject.toString(), ProfileController.access$100(this$0));
      return;
    }
    catch (Exception paramJSONObject) {}
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.ProfileController.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */