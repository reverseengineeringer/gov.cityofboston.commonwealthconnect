package com.seeclickfix.ma.android.auth;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.widget.ImageView;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.ImageLoader;
import com.android.volley.toolbox.ImageLoader.ImageContainer;
import com.seeclickfix.ma.android.MyApplication;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.events.UserProfileLoadedEvent;
import com.seeclickfix.ma.android.net.DeserializeResponse;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import com.seeclickfix.ma.android.objects.user.User;
import com.seeclickfix.ma.android.tasks.GetUserProfileTask;
import com.squareup.otto.Bus;
import com.squareup.otto.Produce;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.json.JSONObject;

public class ProfileController
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ProfileController";
  private static ProfileController instance;
  private Bitmap avatarBitmap;
  private Context c;
  private ImageLoader.ImageContainer container;
  Response.ErrorListener errorListener = new Response.ErrorListener()
  {
    public void onErrorResponse(VolleyError paramAnonymousVolleyError) {}
  };
  Response.Listener<JSONObject> listener = new Response.Listener()
  {
    public void onResponse(JSONObject paramAnonymousJSONObject)
    {
      ArrayList localArrayList = new DeserializeResponse().getJavaObject(paramAnonymousJSONObject.toString(), User.class);
      ProfileController.access$002(ProfileController.this, (User)localArrayList.get(0));
      try
      {
        MyApplication.getEventBus().post(new UserProfileLoadedEvent(mUser));
        PrefsUtil.putString("user_profile_json", paramAnonymousJSONObject.toString(), c);
        return;
      }
      catch (Exception paramAnonymousJSONObject) {}
    }
  };
  private User mUser;
  
  private ProfileController()
  {
    try
    {
      MyApplication.getEventBus().register(this);
      return;
    }
    catch (Exception localException) {}
  }
  
  public static ProfileController getInstance()
  {
    if (instance == null) {
      instance = new ProfileController();
    }
    return instance;
  }
  
  public static void resetAvatar()
  {
    getInstanceavatarBitmap = null;
    getInstancecontainer = null;
  }
  
  public void clearUser(Context paramContext)
  {
    mUser = null;
    PrefsUtil.putString("user_profile_json", null, paramContext);
  }
  
  public User getUserIfAvail(Context paramContext)
  {
    if (mUser == null) {}
    try
    {
      paramContext = PrefsUtil.getString("user_profile_json", null, paramContext);
      mUser = ((User)new DeserializeResponse().getJavaObject(paramContext, User.class).get(0));
      return mUser;
    }
    catch (Exception paramContext)
    {
      for (;;) {}
    }
  }
  
  public void loadUserProfile(AuthUser paramAuthUser, Context paramContext)
  {
    c = paramContext;
    new GetUserProfileTask(paramContext, paramAuthUser.getUserID(), listener, errorListener).execute();
  }
  
  @Produce
  public UserProfileLoadedEvent produceLoginState()
  {
    if (mUser == null) {
      return null;
    }
    return new UserProfileLoadedEvent(mUser);
  }
  
  public void setUserAvatar(Context paramContext, ImageView paramImageView, int paramInt)
  {
    if (mUser != null)
    {
      if (avatarBitmap == null) {
        break label74;
      }
      paramContext = (BitmapDrawable)paramImageView.getDrawable();
      if (paramContext != null) {
        break label35;
      }
      paramImageView.setImageBitmap(avatarBitmap);
    }
    label35:
    do
    {
      return;
      if (paramContext.getBitmap() == null)
      {
        paramImageView.setImageBitmap(avatarBitmap);
        return;
      }
    } while (paramContext.getBitmap().equals(avatarBitmap));
    paramImageView.setImageBitmap(avatarBitmap);
    return;
    label74:
    if ((container == null) || (container.getBitmap() == null))
    {
      if (StringUtils.isNotEmpty(mUser.getAvatarSquareImage()))
      {
        String str = UrlConfig.getBaseUrl(paramContext) + mUser.getAvatarSquareImage();
        container = VolleyRequestQueue.getInstance(paramContext).getImageLoader().get(str, ImageLoader.getImageListener(paramImageView, paramInt, paramInt));
        return;
      }
      paramImageView.setImageResource(paramInt);
      return;
    }
    paramImageView.setImageBitmap(container.getBitmap());
    avatarBitmap = container.getBitmap();
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.auth.ProfileController
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */