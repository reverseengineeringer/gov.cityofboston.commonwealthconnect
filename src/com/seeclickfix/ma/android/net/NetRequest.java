package com.seeclickfix.ma.android.net;

import android.content.Context;
import com.alostpacket.pajamalib.utils.PrefsUtil;
import com.seeclickfix.ma.android.config.AppBuild;
import com.seeclickfix.ma.android.net.util.RequestFactory;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.CookieStore;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.BasicCookieStore;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.cookie.BasicClientCookie;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;

public final class NetRequest
{
  private static final boolean D = false;
  public static final int ERROR_CODE_UKNOWN = -42;
  public static final String GET = "GET";
  private static final boolean GLOBAL_DEBUG = false;
  private static final boolean LOCAL_DEBUG = true;
  public static final String POST = "POST";
  private static final String TAG = "NetRequest";
  private Context c;
  private HttpUriRequest httpcall;
  private volatile boolean isAborted = false;
  private final String method;
  private Map<String, String> paramsMap;
  private final String url;
  
  private NetRequest(Builder paramBuilder)
  {
    url = url;
    method = method;
    paramsMap = paramsMap;
    c = appContext;
  }
  
  private HttpUriRequest addGetParams(HttpUriRequest paramHttpUriRequest)
  {
    Object localObject1 = new StringBuilder();
    ((StringBuilder)localObject1).append("?");
    if ((paramsMap != null) && (paramsMap.size() > 0))
    {
      localObject2 = paramsMap.keySet().iterator();
      while (((Iterator)localObject2).hasNext())
      {
        String str1 = (String)((Iterator)localObject2).next();
        try
        {
          String str2 = URLEncoder.encode((String)paramsMap.get(str1), "UTF-8");
          ((StringBuilder)localObject1).append(str1 + "=" + str2 + "&");
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
      }
    }
    Object localObject2 = ((StringBuilder)localObject1).toString();
    localObject1 = null;
    try
    {
      localObject2 = new URI(url + (String)localObject2);
      localObject1 = localObject2;
    }
    catch (URISyntaxException localURISyntaxException)
    {
      for (;;) {}
    }
    ((HttpGet)paramHttpUriRequest).setURI((URI)localObject1);
    return paramHttpUriRequest;
  }
  
  private HttpUriRequest addPostParams(HttpUriRequest paramHttpUriRequest)
  {
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    if ((paramsMap != null) && (paramsMap.size() > 0))
    {
      Iterator localIterator = paramsMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        try
        {
          localBasicHttpParams.setParameter(str, URLEncoder.encode((String)paramsMap.get(str), "UTF-8"));
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException) {}
      }
    }
    paramHttpUriRequest.setParams(localBasicHttpParams);
    return paramHttpUriRequest;
  }
  
  private void addStaticParamsToMap()
  {
    paramsMap = RequestFactory.addStaticParamsToMap(paramsMap, c);
  }
  
  public void abort()
  {
    if (httpcall != null) {}
    try
    {
      httpcall.abort();
      isAborted = true;
      return;
    }
    catch (Exception localException) {}
  }
  
  public String executeRequest()
    throws IOException
  {
    Object localObject2 = null;
    Object localObject3 = new BasicHttpParams();
    ((HttpParams)localObject3).setParameter("http.protocol.version", HttpVersion.HTTP_1_1);
    ((HttpParams)localObject3).setParameter("http.useragent", AppBuild.getUserAgent(c));
    ((HttpParams)localObject3).setParameter("http.protocol.cookie-policy", "compatibility");
    Object localObject1 = new BasicCookieStore();
    BasicClientCookie localBasicClientCookie = new BasicClientCookie(AppBuild.getCookieName(c), PrefsUtil.getString("Pref:COOKIE", "Error No Cookie", c));
    localBasicClientCookie.setDomain(".seeclickfix.com");
    localBasicClientCookie.setPath("/");
    ((CookieStore)localObject1).addCookie(localBasicClientCookie);
    localObject3 = new DefaultHttpClient((HttpParams)localObject3);
    ((DefaultHttpClient)localObject3).setCookieStore((CookieStore)localObject1);
    addStaticParamsToMap();
    if (method.equals("POST")) {
      httpcall = new HttpPost(url);
    }
    for (httpcall = addPostParams(httpcall);; httpcall = addGetParams(httpcall))
    {
      localObject3 = ((DefaultHttpClient)localObject3).execute(httpcall).getEntity();
      localObject1 = localObject2;
      if (localObject3 != null)
      {
        localObject1 = localObject2;
        if (!isAborted) {
          localObject1 = EntityUtils.toString((HttpEntity)localObject3);
        }
      }
      return (String)localObject1;
      httpcall = new HttpGet(url);
    }
  }
  
  public String executeRequest(String paramString)
  {
    try
    {
      String str = executeRequest();
      return str;
    }
    catch (IOException localIOException) {}
    return paramString;
  }
  
  public static class Builder
  {
    private Context appContext;
    private String method = "GET";
    private Map<String, String> paramsMap = new HashMap();
    private String url;
    
    public Builder(Context paramContext)
    {
      appContext = paramContext;
    }
    
    public Builder(Builder paramBuilder)
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
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.net.NetRequest
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */