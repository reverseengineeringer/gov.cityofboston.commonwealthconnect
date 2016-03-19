package com.seeclickfix.ma.android.net;

import android.content.Context;
import java.util.HashMap;
import java.util.Map;

public class NetRequest$Builder
{
  private Context appContext;
  private String method = "GET";
  private Map<String, String> paramsMap = new HashMap();
  private String url;
  
  public NetRequest$Builder(Context paramContext)
  {
    appContext = paramContext;
  }
  
  public NetRequest$Builder(Builder paramBuilder)
  {
    url = url;
    method = method;
    appContext = appContext;
  }
  
  public Builder add(String paramString1, String paramString2)
  {
    paramsMap.put(paramString1, paramString2);
    return this;
  }
  
  public Builder apiKey(String paramString)
  {
    paramsMap.put("api_key", paramString);
    return this;
  }
  
  public Builder at(String paramString)
  {
    paramsMap.put("at", paramString);
    return this;
  }
  
  public NetRequest create()
  {
    return new NetRequest(this, null);
  }
  
  public Builder email(String paramString)
  {
    paramsMap.put("email", paramString);
    return this;
  }
  
  public Map<String, String> getParamsMap()
  {
    return paramsMap;
  }
  
  public Builder lat(double paramDouble)
  {
    paramsMap.put("lat", String.valueOf(paramDouble));
    return this;
  }
  
  public Builder lat(String paramString)
  {
    paramsMap.put("lat", paramString);
    return this;
  }
  
  public Builder lng(double paramDouble)
  {
    paramsMap.put("lng", String.valueOf(paramDouble));
    return this;
  }
  
  public Builder lng(String paramString)
  {
    paramsMap.put("lng", paramString);
    return this;
  }
  
  public Builder method(String paramString)
  {
    method = paramString;
    return this;
  }
  
  public Builder numResults(int paramInt)
  {
    paramsMap.put("num_results", String.valueOf(paramInt));
    return this;
  }
  
  public Builder page(int paramInt)
  {
    paramsMap.put("page", String.valueOf(paramInt));
    return this;
  }
  
  public Builder paramsMap(Map<String, String> paramMap)
  {
    paramsMap = paramMap;
    return this;
  }
  
  public Builder placeUrl(String paramString)
  {
    paramsMap.put("place_url", paramString);
    return this;
  }
  
  public Builder url(String paramString)
  {
    url = paramString;
    return this;
  }
  
  public Builder zoom(float paramFloat)
  {
    paramsMap.put("zoom", String.valueOf(paramFloat));
    return this;
  }
  
  public Builder zoom(int paramInt)
  {
    paramsMap.put("zoom", String.valueOf(paramInt));
    return this;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.NetRequest.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */