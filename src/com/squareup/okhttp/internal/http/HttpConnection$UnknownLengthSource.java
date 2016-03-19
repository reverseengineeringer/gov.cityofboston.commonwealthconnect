package com.squareup.okhttp.internal.http;

import java.io.IOException;
import java.net.CacheRequest;
import okio.Buffer;
import okio.BufferedSource;
import okio.Source;
import okio.Timeout;

class HttpConnection$UnknownLengthSource
  extends HttpConnection.AbstractSource
  implements Source
{
  private boolean inputExhausted;
  
  HttpConnection$UnknownLengthSource(HttpConnection paramHttpConnection, CacheRequest paramCacheRequest)
    throws IOException
  {
    super(paramHttpConnection, paramCacheRequest);
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    if (!inputExhausted) {
      unexpectedEndOfInput();
    }
    closed = true;
  }
  
  public long read(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    if (closed) {
      throw new IllegalStateException("closed");
    }
    if (inputExhausted) {
      return -1L;
    }
    paramLong = HttpConnection.access$900(this$0).read(paramBuffer, paramLong);
    if (paramLong == -1L)
    {
      inputExhausted = true;
      endOfInput(false);
      return -1L;
    }
    cacheWrite(paramBuffer, paramLong);
    return paramLong;
  }
  
  public Timeout timeout()
  {
    return HttpConnection.access$900(this$0).timeout();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpConnection.UnknownLengthSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */