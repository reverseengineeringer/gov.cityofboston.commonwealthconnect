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
import com.seeclickfix.ma.android.objects.user.AuthUser;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.inject.Inject;
import org.json.JSONArray;

public class GetSingleIssueTask
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "GetSingleIssueTask";
  private Context c;
  
  @Inject
  public GetSingleIssueTask(Context paramContext)
  {
    c = paramContext;
  }
  
  public String buildUrl(Map<String, String> paramMap, int paramInt)
  {
    Object localObject = new NetRequest.Builder(c);
    ((NetRequest.Builder)localObject).apiKey("b81bbe8e1efaa8cbfc892e1b0f7148f380dc2249");
    if (AuthManager.isAuthenticated()) {
      ((NetRequest.Builder)localObject).email(AuthManager.authenticatedUser().getEmail());
    }
    for (;;)
    {
      localObject = ((NetRequest.Builder)localObject).getParamsMap();
      ((Map)localObject).putAll(paramMap);
      paramMap = RequestFactory.addStaticParamsToMap((Map)localObject, c);
      localObject = UrlConfig.getSingleIssueUrl(c);
      return RequestFactory.constructUrl(String.format(Locale.US, (String)localObject, new Object[] { Integer.valueOf(paramInt) }), paramMap);
      ((NetRequest.Builder)localObject).email("nobody@example.com");
    }
  }
  
  public void cancel()
  {
    VolleyRequestQueue.getInstance(c).getQueue().cancelAll(this);
  }
  
  public void execute(int paramInt, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener)
  {
    execute(paramInt, paramListener, paramErrorListener, new HashMap());
  }
  
  public void execute(int paramInt, Response.Listener<JSONArray> paramListener, Response.ErrorListener paramErrorListener, Map<String, String> paramMap)
  {
    paramListener = new CustomJsonArrayRequest(buildUrl(paramMap, paramInt), RequestFactory.getStandardHeaders(c), paramListener, paramErrorListener, c);
    paramListener.setTag(this);
    VolleyRequestQueue.getInstance(c).add(paramListener);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.GetSingleIssueTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */