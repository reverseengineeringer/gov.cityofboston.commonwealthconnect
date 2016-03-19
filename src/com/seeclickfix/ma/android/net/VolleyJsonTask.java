package com.seeclickfix.ma.android.net;

import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.JsonObjectRequest;
import com.seeclickfix.ma.android.net.volley.SimpleJsonListener;
import com.seeclickfix.ma.android.net.volley.VolleyRequestQueue;
import org.json.JSONObject;

public class VolleyJsonTask
{
  public static void enqueueJsonGet(String paramString, Response.Listener<JSONObject> paramListener)
  {
    enqueueJsonGet(paramString, paramListener, new SimpleJsonListener(paramListener));
  }
  
  public static void enqueueJsonGet(String paramString, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    paramString = new JsonObjectRequest(paramString, null, paramListener, paramErrorListener);
    VolleyRequestQueue.getInstance().add(paramString);
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.VolleyJsonTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */