package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.NetRequest.Builder;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.volley.CustomJsonArrayRequest;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.net.volley.VolleyRetryPolicy;
import com.seeclickfix.ma.android.objects.DedicatedApp;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.Map;
import org.json.JSONArray;

public class GetIssuesMapTask
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String REQUEST_TAG_1 = "REQUEST_TAG_1";
  private static final String REQUEST_TAG_2 = "REQUEST_TAG_2";
  private static final String REQUEST_TAG_3 = "REQUEST_TAG_3";
  private static final String REQUEST_TAG_4 = "REQUEST_TAG_4";
  private static final String REQUEST_TAG_5 = "REQUEST_TAG_5";
  private static final String TAG = "GetIssuesMapTask";
  private Context c;
  private Response.ErrorListener errorListener;
  private double lat;
  private double latMax;
  private double latMin;
  private Response.Listener<JSONArray> listener;
  private double lng;
  private double lngMax;
  private double lngMin;
  private int page;
  private Place place;
  private float zoom;
  
  public GetIssuesMapTask(Context paramContext, Place paramPlace, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener, double paramDouble1, double paramDouble2, float paramFloat, double paramDouble3, double paramDouble4, double paramDouble5, double paramDouble6, int paramInt)
  {
    c = paramContext;
    place = paramPlace;
    listener = paramListener;
    errorListener = paramErrorListener;
    lat = paramDouble1;
    lng = paramDouble2;
    zoom = paramFloat;
    latMin = paramDouble3;
    latMax = paramDouble4;
    lngMin = paramDouble5;
    lngMax = paramDouble6;
    page = paramInt;
  }
  
  public GetIssuesMapTask(Context paramContext, Place paramPlace, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener, double paramDouble1, double paramDouble2, float paramFloat, int paramInt)
  {
    c = paramContext;
    place = paramPlace;
    listener = paramListener;
    errorListener = paramErrorListener;
    lat = paramDouble1;
    lng = paramDouble2;
    zoom = paramFloat;
    page = paramInt;
  }
  
  public void cancel()
  {
    try
    {
      VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_1");
      VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_2");
      VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_3");
      VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_4");
      VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_5");
      return;
    }
    catch (Exception localException) {}
  }
  
  public void execute()
  {
    Object localObject = new NetRequest.Builder(c);
    ((NetRequest.Builder)localObject).lat(lat);
    ((NetRequest.Builder)localObject).lng(lng);
    ((NetRequest.Builder)localObject).zoom(zoom);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    ((NetRequest.Builder)localObject).numResults(5);
    if (AuthManager.isAuthenticated())
    {
      ((NetRequest.Builder)localObject).email(AuthManager.authenticatedUser().getEmail());
      Map localMap = RequestFactory.addStaticParamsToMap(((NetRequest.Builder)localObject).getParamsMap(), c);
      localMap.putAll(DedicatedAppManager.getDedicatedApp(c).getIssueFilter());
      localMap.put("placeCacheKey", place.getName() + page);
      if (page > 0) {
        ((NetRequest.Builder)localObject).page(page);
      }
      localObject = new CustomJsonArrayRequest(RequestFactory.constructUrl(UrlConfig.getIssueListUrl(c), localMap), RequestFactory.getStandardHeaders(c), listener, errorListener, c);
      if (page != 1) {
        break label319;
      }
      ((CustomJsonArrayRequest)localObject).setTag("REQUEST_TAG_1");
    }
    for (;;)
    {
      if (page == 1)
      {
        VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_1");
        VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_2");
        VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_3");
        VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_4");
        VolleyRequestQueue.getInstance(c).getQueue().cancelAll("REQUEST_TAG_5");
      }
      ((CustomJsonArrayRequest)localObject).setRetryPolicy(new VolleyRetryPolicy());
      VolleyRequestQueue.getInstance(c).add((Request)localObject);
      return;
      ((NetRequest.Builder)localObject).email("nobody@example.com");
      break;
      label319:
      if (page == 2) {
        ((CustomJsonArrayRequest)localObject).setTag("REQUEST_TAG_2");
      } else if (page == 3) {
        ((CustomJsonArrayRequest)localObject).setTag("REQUEST_TAG_3");
      } else if (page == 4) {
        ((CustomJsonArrayRequest)localObject).setTag("REQUEST_TAG_4");
      } else if (page == 5) {
        ((CustomJsonArrayRequest)localObject).setTag("REQUEST_TAG_5");
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetIssuesMapTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */