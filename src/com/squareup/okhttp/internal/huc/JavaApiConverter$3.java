package com.squareup.okhttp.internal.huc;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.MediaType;
import com.squareup.okhttp.ResponseBody;
import com.squareup.okhttp.internal.http.OkHeaders;
import okio.BufferedSource;

final class JavaApiConverter$3
  extends ResponseBody
{
  JavaApiConverter$3(Headers paramHeaders, BufferedSource paramBufferedSource) {}
  
  public long contentLength()
  {
    return OkHeaders.contentLength(val$okHeaders);
  }
  
  public MediaType contentType()
  {
    String str = val$okHeaders.get("Content-Type");
    if (str == null) {
      return null;
    }
    return MediaType.parse(str);
  }
  
  public BufferedSource source()
  {
    return val$source;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.huc.JavaApiConverter.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */