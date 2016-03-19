package com.seeclickfix.ma.android.net;

import com.google.gson.Gson;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class DeserializeResponse<T>
{
  private static final boolean D = false;
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  private static final String TAG = "DeserializeResponse";
  
  public ArrayList<T> getJavaObject(String paramString, Class paramClass)
  {
    Gson localGson = new Gson();
    ArrayList localArrayList = new ArrayList();
    try
    {
      if (paramString.startsWith("["))
      {
        paramString = new JSONArray(paramString);
        int j = paramString.length();
        int i = 0;
        while (i < j)
        {
          localArrayList.add(localGson.fromJson(paramString.getJSONObject(i).toString(), paramClass));
          i += 1;
        }
      }
      localArrayList.add(localGson.fromJson(new JSONObject(paramString).toString(), paramClass));
      return localArrayList;
    }
    catch (JSONException paramString) {}
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.DeserializeResponse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */