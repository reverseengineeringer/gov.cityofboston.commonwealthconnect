package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Response;
import com.squareup.okhttp.ResponseBody;
import com.squareup.okhttp.internal.http.OkHeaders;
import com.squareup.okhttp.internal.http.StatusLine;
import java.io.IOException;
import java.io.InputStream;
import java.net.CacheResponse;
import java.util.List;
import java.util.Map;

final class JavaApiConverter$2
  extends CacheResponse
{
  JavaApiConverter$2(Headers paramHeaders, Response paramResponse, ResponseBody paramResponseBody) {}
  
  public InputStream getBody()
    throws IOException
  {
    if (val$body == null) {
      return null;
    }
    return val$body.byteStream();
  }
  
  public Map<String, List<String>> getHeaders()
    throws IOException
  {
    return OkHeaders.toMultimap(val$headers, StatusLine.get(val$response).toString());
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.huc.JavaApiConverter.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */