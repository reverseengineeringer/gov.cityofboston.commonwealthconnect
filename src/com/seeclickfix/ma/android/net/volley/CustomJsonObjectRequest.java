package com.seeclickfix.ma.android.net.volley;

import android.content.Context;
import com.android.volley.AuthFailureError;
import com.android.volley.NetworkResponse;
import com.android.volley.ParseError;
import com.android.volley.Request;
import com.android.volley.Request.Priority;
import com.android.volley.Response;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.HttpHeaderParser;
import com.seeclickfix.ma.android.config.AppBuild;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

public class CustomJsonObjectRequest
  extends Request<JSONObject>
{
  private Context c;
  private Response.Listener<JSONObject> listener;
  private Request.Priority mPriority = Request.Priority.HIGH;
  private Map<String, String> params;
  
  public CustomJsonObjectRequest(int paramInt, String paramString, Map<String, String> paramMap, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramInt, paramString, paramErrorListener);
    listener = paramListener;
    params = paramMap;
  }
  
  public CustomJsonObjectRequest(String paramString, Map<String, String> paramMap, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener, Context paramContext)
  {
    super(0, paramString, paramErrorListener);
    listener = paramListener;
    params = paramMap;
    c = paramContext;
  }
  
  protected void deliverResponse(JSONObject paramJSONObject)
  {
    listener.onResponse(paramJSONObject);
  }
  
  public Map<String, String> getHeaders()
    throws AuthFailureError
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("User-agent", AppBuild.getUserAgent(c));
    return localHashMap;
  }
  
  protected Map<String, String> getParams()
    throws AuthFailureError
  {
    return params;
  }
  
  public Request.Priority getPriority()
  {
    return mPriority;
  }
  
  protected Response<JSONObject> parseNetworkResponse(NetworkResponse paramNetworkResponse)
  {
    try
    {
      paramNetworkResponse = Response.success(new JSONObject(new String(data, HttpHeaderParser.parseCharset(headers))), HttpHeaderParser.parseCacheHeaders(paramNetworkResponse));
      return paramNetworkResponse;
    }
    catch (UnsupportedEncodingException paramNetworkResponse)
    {
      return Response.error(new ParseError(paramNetworkResponse));
    }
    catch (JSONException paramNetworkResponse) {}
    return Response.error(new ParseError(paramNetworkResponse));
  }
  
  public void setPriority(Request.Priority paramPriority)
  {
    mPriority = paramPriority;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.volley.CustomJsonObjectRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */