package com.squareup.okhttp;

import com.squareup.okhttp.internal.http.OkHeaders;
import okio.BufferedSource;

class Call$RealResponseBody
  extends ResponseBody
{
  private final Response response;
  private final BufferedSource source;
  
  Call$RealResponseBody(Response paramResponse, BufferedSource paramBufferedSource)
  {
    response = paramResponse;
    source = paramBufferedSource;
  }
  
  public long contentLength()
  {
    return OkHeaders.contentLength(response);
  }
  
  public MediaType contentType()
  {
    String str = response.header("Content-Type");
    if (str != null) {
      return MediaType.parse(str);
    }
    return null;
  }
  
  public BufferedSource source()
  {
    return source;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.Call.RealResponseBody
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */