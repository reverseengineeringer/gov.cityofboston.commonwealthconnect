package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.Cache;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.net.NetRequest.Builder;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.volley.CustomJsonObjectRequest;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.net.volley.VolleyRetryPolicy;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.Map;
import org.json.JSONObject;

public abstract class ZoneTaskAbstract
  implements ZoneTaskInterface
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "ZoneTaskAbstract";
  protected String PLACE_TAG;
  protected Context c;
  protected Response.ErrorListener errorListener;
  protected Response.Listener<JSONObject> listener;
  protected Place place;
  
  public ZoneTaskAbstract(Context paramContext, Place paramPlace, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    c = paramContext;
    place = paramPlace;
    listener = paramListener;
    errorListener = paramErrorListener;
    PLACE_TAG = ("ZoneTaskAbstract" + paramPlace.getName());
  }
  
  public Map<String, String> buildParams()
  {
    double d1 = place.getPlaceLat();
    double d2 = place.getPlaceLng();
    Object localObject = new NetRequest.Builder(c);
    ((NetRequest.Builder)localObject).lat(d1);
    ((NetRequest.Builder)localObject).lng(d2);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    if (AuthManager.isAuthenticated()) {
      ((NetRequest.Builder)localObject).email(AuthManager.authenticatedUser().getEmail());
    }
    for (;;)
    {
      if (place.getShouldReload()) {
        VolleyRequestQueue.getInstance(c).getQueue().getCache().remove(place.getZoneCacheKey());
      }
      localObject = RequestFactory.addStaticParamsToMap(((NetRequest.Builder)localObject).getParamsMap(), c);
      ((Map)localObject).put("placeCacheKey", place.getName());
      return (Map<String, String>)localObject;
      ((NetRequest.Builder)localObject).email("nobody@example.com");
    }
  }
  
  public void cancel()
  {
    VolleyRequestQueue.getInstance(c).getQueue().cancelAll(PLACE_TAG);
  }
  
  protected void performRequest(String paramString, Map<String, String> paramMap)
  {
    paramString = new CustomJsonObjectRequest(paramString, paramMap, listener, errorListener, c);
    paramString.setRetryPolicy(new VolleyRetryPolicy());
    paramString.setTag(PLACE_TAG);
    place.setZoneCacheKey(paramString.getCacheKey());
    VolleyRequestQueue.getInstance(c).add(paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.ZoneTaskAbstract
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */