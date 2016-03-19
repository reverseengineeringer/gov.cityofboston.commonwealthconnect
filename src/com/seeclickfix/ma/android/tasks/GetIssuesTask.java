package com.seeclickfix.ma.android.tasks;

import android.content.Context;
import com.android.volley.Cache;
import com.android.volley.RequestQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.seeclickfix.ma.android.auth.AuthManager;
import com.seeclickfix.ma.android.config.DedicatedAppManager;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.net.NetRequest.Builder;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import com.seeclickfix.ma.android.net.volley.CustomJsonArrayRequest;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import com.seeclickfix.ma.android.objects.issue.IssueFilter;
import com.seeclickfix.ma.android.objects.loc.Place;
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.Locale;
import java.util.Map;
import org.json.JSONArray;

public class GetIssuesTask
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetIssuesTask";
  private Context c;
  private Response.ErrorListener errorListener;
  private Response.Listener<JSONArray> listener;
  private int page;
  private Place place;
  private CustomJsonArrayRequest req;
  
  public GetIssuesTask(Context paramContext, Place paramPlace, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener, int paramInt)
  {
    c = paramContext;
    place = paramPlace;
    listener = paramListener;
    errorListener = paramErrorListener;
    page = paramInt;
  }
  
  public void cancel()
  {
    VolleyRequestQueue.getInstance(c).getQueue().cancelAll("GetIssuesTask");
  }
  
  public void execute()
  {
    Object localObject2 = new NetRequest.Builder(c);
    double d1 = place.getPlaceLat();
    double d2 = place.getPlaceLng();
    ((NetRequest.Builder)localObject2).lat(d1);
    ((NetRequest.Builder)localObject2).lng(d2);
    ((NetRequest.Builder)localObject2).zoom(12);
    ((NetRequest.Builder)localObject2).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    ((NetRequest.Builder)localObject2).numResults(10);
    if (page > 0) {
      ((NetRequest.Builder)localObject2).page(page);
    }
    Object localObject1 = null;
    String str;
    if (AuthManager.isAuthenticated())
    {
      localObject1 = AuthManager.authenticatedUser();
      ((NetRequest.Builder)localObject2).email(((AuthUser)localObject1).getEmail());
      localObject2 = RequestFactory.addStaticParamsToMap(((NetRequest.Builder)localObject2).getParamsMap(), c);
      ((Map)localObject2).putAll(new IssueFilter(DedicatedAppManager.getDedicatedApp(c)).get());
      ((Map)localObject2).put("placeCacheKey", place.getName());
      if (!place.isMyReports()) {
        break label404;
      }
      if (localObject1 == null) {
        break label385;
      }
      ((Map)localObject2).remove("lat");
      ((Map)localObject2).remove("lng");
      ((Map)localObject2).remove("zoom");
      ((Map)localObject2).put("sort", "issues.created_at");
      str = UrlConfig.getIssuesbyUserUrl(c);
    }
    label385:
    label404:
    for (localObject1 = String.format(Locale.US, str, new Object[] { Integer.valueOf(((AuthUser)localObject1).getUserID()) });; localObject1 = UrlConfig.getIssueListUrl(c))
    {
      if (place.getShouldReload())
      {
        place.setShouldReload(false);
        VolleyRequestQueue.getInstance(c).getQueue().getCache().remove(place.getCacheKey());
      }
      req = new CustomJsonArrayRequest(RequestFactory.constructUrl((String)localObject1, (Map)localObject2), RequestFactory.getStandardHeaders(c), listener, errorListener, c);
      req.setTag("GetIssuesTask");
      place.setCacheKey(req.getCacheKey());
      VolleyRequestQueue.getInstance(c).add(req);
      return;
      ((NetRequest.Builder)localObject2).email("nobody@example.com");
      break;
      errorListener.onErrorResponse(new VolleyError("NOT_LOGGED_IN_MY_REPORTS"));
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetIssuesTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */