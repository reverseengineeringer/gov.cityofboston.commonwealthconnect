package com.seeclickfix.ma.android.net;

import android.location.Location;
import android.net.Uri;
import android.net.Uri.Builder;
import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.config.UrlConfig;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.location.SimpleLocation;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GoogleGeocodeRequest
  extends VolleyJsonTask
{
  public static String buildUrl(String paramString, Location paramLocation)
  {
    String str = "";
    if (paramLocation != null)
    {
      double d1 = paramLocation.getLatitude();
      double d2 = paramLocation.getLongitude();
      str = String.format("%f,%f|%f,%f", new Object[] { Double.valueOf(d1), Double.valueOf(d2), Double.valueOf(d1), Double.valueOf(d2) });
    }
    return Uri.parse(UrlConfig.getGoogleGeocodeUrl()).buildUpon().appendQueryParameter("address", paramString).appendQueryParameter("bounds", str).build().toString();
  }
  
  public static void geocode(String paramString, Location paramLocation, SafeListener<List<SimpleLocation>> paramSafeListener)
  {
    enqueueJsonGet(buildUrl(paramString, paramLocation), new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        val$listener.onSuccess(parseResponse(paramAnonymousJSONObject));
      }
      
      List<SimpleLocation> parseResponse(JSONObject paramAnonymousJSONObject)
      {
        ArrayList localArrayList2 = new ArrayList();
        localArrayList1 = localArrayList2;
        if (paramAnonymousJSONObject != null) {
          try
          {
            paramAnonymousJSONObject = paramAnonymousJSONObject.getJSONArray("results");
            int i = 0;
            for (;;)
            {
              localArrayList1 = localArrayList2;
              if (i >= paramAnonymousJSONObject.length()) {
                break;
              }
              localArrayList2.add(SimpleLocation.fromJson(paramAnonymousJSONObject.getJSONObject(i)));
              i += 1;
            }
            return localArrayList1;
          }
          catch (JSONException paramAnonymousJSONObject)
          {
            localArrayList1 = new ArrayList();
          }
        }
      }
    });
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.GoogleGeocodeRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */