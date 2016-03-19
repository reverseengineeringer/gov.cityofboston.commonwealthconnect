package com.seeclickfix.ma.android.net.volley;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import org.json.JSONObject;

public class SimpleJsonListener
  implements Response.Listener<JSONObject>, Response.ErrorListener
{
  private Response.Listener<JSONObject> listener;
  
  public SimpleJsonListener(Response.Listener<JSONObject> paramListener)
  {
    listener = paramListener;
  }
  
  public void onErrorResponse(VolleyError paramVolleyError)
  {
    listener.onResponse(null);
  }
  
  public void onResponse(JSONObject paramJSONObject)
  {
    listener.onResponse(paramJSONObject);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.volley.SimpleJsonListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */