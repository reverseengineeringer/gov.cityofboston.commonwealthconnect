package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.NetRequest.Builder;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.volley.CustomJsonObjectRequest;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.net.volley.VolleyRetryPolicy;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.Locale;
import java.util.Map;
import org.json.JSONObject;

public class GetUserProfileTask
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetUserProfileTask";
  private Context c;
  private Response.ErrorListener errorListener;
  private Response.Listener<JSONObject> listener;
  private CustomJsonObjectRequest req;
  private int userId;
  private AuthUser userObj;
  
  public GetUserProfileTask(Context paramContext, int paramInt, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    c = paramContext;
    userId = paramInt;
    listener = paramListener;
    errorListener = paramErrorListener;
  }
  
  public GetUserProfileTask(Context paramContext, int paramInt, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener, AuthUser paramAuthUser)
  {
    c = paramContext;
    userId = paramInt;
    userObj = paramAuthUser;
    listener = paramListener;
    errorListener = paramErrorListener;
    cancel();
  }
  
  public void cancel()
  {
    VolleyRequestQueue.getInstance(c).getQueue().cancelAll("GetUserProfileTask");
  }
  
  public void execute()
  {
    Object localObject = new NetRequest.Builder(c);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    localObject = RequestFactory.addStaticParamsToMap(((NetRequest.Builder)localObject).getParamsMap(), c);
    String str = UrlConfig.getUserProfileUrl(c);
    req = new CustomJsonObjectRequest(RequestFactory.constructUrl(String.format(Locale.US, str, new Object[] { Integer.valueOf(userId) }), (Map)localObject), RequestFactory.getStandardHeaders(c), listener, errorListener, c);
    req.setRetryPolicy(new VolleyRetryPolicy());
    req.setTag("GetUserProfileTask");
    VolleyRequestQueue.getInstance(c).add(req);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetUserProfileTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */