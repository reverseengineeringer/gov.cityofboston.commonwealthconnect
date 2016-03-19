package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
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

public class GetCommentsTask
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetMyCommentsTask";
  private Context c;
  private Response.ErrorListener errorListener;
  private int id;
  private Response.Listener<JSONArray> listener;
  private Place place;
  private CustomJsonArrayRequest req;
  
  public GetCommentsTask(Context paramContext, int paramInt, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener)
  {
    c = paramContext;
    id = paramInt;
    listener = paramListener;
    errorListener = paramErrorListener;
  }
  
  public void cancel()
  {
    VolleyRequestQueue.getInstance(c).getQueue().cancelAll("GetMyCommentsTask");
  }
  
  public void execute()
  {
    Object localObject = new NetRequest.Builder(c);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    if (AuthManager.isAuthenticated()) {
      ((NetRequest.Builder)localObject).email(AuthManager.authenticatedUser().getEmail());
    }
    for (;;)
    {
      localObject = RequestFactory.addStaticParamsToMap(((NetRequest.Builder)localObject).getParamsMap(), c);
      ((Map)localObject).remove("lat");
      ((Map)localObject).remove("lng");
      ((Map)localObject).remove("zoom");
      ((Map)localObject).put("exclude_activity", "true");
      String str = UrlConfig.getCommentsUrl(c);
      req = new CustomJsonArrayRequest(RequestFactory.constructUrl(String.format(Locale.US, str, new Object[] { Integer.valueOf(id) }), (Map)localObject), RequestFactory.getStandardHeaders(c), listener, errorListener, c);
      req.setRetryPolicy(new VolleyRetryPolicy());
      req.setTag("GetMyCommentsTask");
      VolleyRequestQueue.getInstance(c).add(req);
      return;
      ((NetRequest.Builder)localObject).email("nobody@example.com");
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetCommentsTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */