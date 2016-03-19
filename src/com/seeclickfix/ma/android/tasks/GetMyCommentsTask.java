package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.NetRequest.Builder;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.volley.CustomJsonArrayRequest;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.net.volley.VolleyRetryPolicy;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;

public class GetMyCommentsTask
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetMyCommentsTask";
  private Context c;
  private Response.ErrorListener errorListener;
  private Response.Listener<JSONArray> listener;
  private int page;
  private Place place;
  private CustomJsonArrayRequest req;
  
  public GetMyCommentsTask(Context paramContext, Place paramPlace, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener, int paramInt)
  {
    c = paramContext;
    place = paramPlace;
    listener = paramListener;
    errorListener = paramErrorListener;
    page = paramInt;
    cancel();
  }
  
  public void cancel()
  {
    VolleyRequestQueue.getInstance(c).getQueue().cancelAll("GetMyCommentsTask");
  }
  
  public void execute()
  {
    Object localObject = new NetRequest.Builder(c);
    double d1 = place.getPlaceLat();
    double d2 = place.getPlaceLng();
    ((NetRequest.Builder)localObject).lat(d1);
    ((NetRequest.Builder)localObject).lng(d2);
    ((NetRequest.Builder)localObject).zoom(12);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    ((NetRequest.Builder)localObject).numResults(10);
    if (page > 0) {
      ((NetRequest.Builder)localObject).page(page);
    }
    AuthUser localAuthUser = null;
    if (AuthManager.isAuthenticated())
    {
      localAuthUser = AuthManager.authenticatedUser();
      ((NetRequest.Builder)localObject).email(localAuthUser.getEmail());
    }
    for (;;)
    {
      localObject = RequestFactory.addStaticParamsToMap(((NetRequest.Builder)localObject).getParamsMap(), c);
      ((Map)localObject).put("placeCacheKey", place.getName());
      if (localAuthUser == null) {
        break;
      }
      ((Map)localObject).remove("lat");
      ((Map)localObject).remove("lng");
      ((Map)localObject).remove("zoom");
      ((Map)localObject).remove("email");
      ((Map)localObject).put("sort", "comments.updated_at");
      String str = UrlConfig.getCommentsbyUserUrl(c);
      req = new CustomJsonArrayRequest(RequestFactory.constructUrl(String.format(Locale.US, str, new Object[] { Integer.valueOf(localAuthUser.getUserID()) }), (Map)localObject), RequestFactory.getStandardHeaders(c), listener, errorListener, c);
      req.setRetryPolicy(new VolleyRetryPolicy());
      req.setTag("GetMyCommentsTask");
      VolleyRequestQueue.getInstance(c).add(req);
      return;
      ((NetRequest.Builder)localObject).email("nobody@example.com");
    }
    errorListener.onErrorResponse(new VolleyError("NOT_LOGGED_IN_MY_COMMENTS"));
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetMyCommentsTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */