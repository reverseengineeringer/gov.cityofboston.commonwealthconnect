package com.squareup.okhttp;

import com.squareup.okhttp.internal.http.HttpMethod;
import java.net.URL;

public class Request$Builder
{
  private RequestBody body;
  private Headers.Builder headers;
  private String method;
  private Object tag;
  private URL url;
  private String urlString;
  
  public Request$Builder()
  {
    method = "GET";
    headers = new Headers.Builder();
  }
  
  private Request$Builder(Request paramRequest)
  {
    urlString = Request.access$700(paramRequest);
    url = Request.access$800(paramRequest);
    method = Request.access$900(paramRequest);
    body = Request.access$1000(paramRequest);
    tag = Request.access$1100(paramRequest);
    headers = Request.access$1200(paramRequest).newBuilder();
  }
  
  public Builder addHeader(String paramString1, String paramString2)
  {
    headers.add(paramString1, paramString2);
    return this;
  }
  
  public Request build()
  {
    if (urlString == null) {
      throw new IllegalStateException("url == null");
    }
    return new Request(this, null);
  }
  
  public Builder delete()
  {
    return method("DELETE", null);
  }
  
  public Builder get()
  {
    return method("GET", null);
  }
  
  public Builder head()
  {
    return method("HEAD", null);
  }
  
  public Builder header(String paramString1, String paramString2)
  {
    headers.set(paramString1, paramString2);
    return this;
  }
  
  public Builder headers(Headers paramHeaders)
  {
    headers = paramHeaders.newBuilder();
    return this;
  }
  
  public Builder method(String paramString, RequestBody paramRequestBody)
  {
    if ((paramString == null) || (paramString.length() == 0)) {
      throw new IllegalArgumentException("method == null || method.length() == 0");
    }
    if ((paramRequestBody != null) && (!HttpMethod.hasRequestBody(paramString))) {
      throw new IllegalArgumentException("method " + paramString + " must not have a request body.");
    }
    method = paramString;
    body = paramRequestBody;
    return this;
  }
  
  public Builder patch(RequestBody paramRequestBody)
  {
    return method("PATCH", paramRequestBody);
  }
  
  public Builder post(RequestBody paramRequestBody)
  {
    return method("POST", paramRequestBody);
  }
  
  public Builder put(RequestBody paramRequestBody)
  {
    return method("PUT", paramRequestBody);
  }
  
  public Builder removeHeader(String paramString)
  {
    headers.removeAll(paramString);
    return this;
  }
  
  public Builder tag(Object paramObject)
  {
    tag = paramObject;
    return this;
  }
  
  public Builder url(String paramString)
  {
    if (paramString == null) {
      throw new IllegalArgumentException("url == null");
    }
    urlString = paramString;
    return this;
  }
  
  public Builder url(URL paramURL)
  {
    if (paramURL == null) {
      throw new IllegalArgumentException("url == null");
    }
    url = paramURL;
    urlString = paramURL.toString();
    return this;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Request.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */