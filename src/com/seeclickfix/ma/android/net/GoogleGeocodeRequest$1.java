package com.seeclickfix.ma.android.net;

import com.android.volley.Response.Listener;
import com.seeclickfix.ma.android.fragments.interfaces.SafeListener;
import com.seeclickfix.ma.android.location.SimpleLocation;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

final class GoogleGeocodeRequest$1
  implements Response.Listener<JSONObject>
{
  GoogleGeocodeRequest$1(SafeListener paramSafeListener) {}
  
  public void onResponse(JSONObject paramJSONObject)
  {
    val$listener.onSuccess(parseResponse(paramJSONObject));
  }
  
  List<SimpleLocation> parseResponse(JSONObject paramJSONObject)
  {
    ArrayList localArrayList2 = new ArrayList();
    localArrayList1 = localArrayList2;
    if (paramJSONObject != null) {
      try
      {
        paramJSONObject = paramJSONObject.getJSONArray("results");
        int i = 0;
        for (;;)
        {
          localArrayList1 = localArrayList2;
          if (i >= paramJSONObject.length()) {
            break;
          }
          localArrayList2.add(SimpleLocation.fromJson(paramJSONObject.getJSONObject(i)));
          i += 1;
        }
        return localArrayList1;
      }
      catch (JSONException paramJSONObject)
      {
        localArrayList1 = new ArrayList();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.GoogleGeocodeRequest.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */