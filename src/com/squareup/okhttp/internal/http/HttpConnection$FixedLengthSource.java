package com.squareup.okhttp.internal.http;

import java.io.IOException;
import java.net.CacheRequest;
import java.net.ProtocolException;
import okio.Buffer;
import okio.BufferedSource;
import okio.Source;
import okio.Timeout;

class HttpConnection$FixedLengthSource
  extends HttpConnection.AbstractSource
  implements Source
{
  private long bytesRemaining;
  
  public HttpConnection$FixedLengthSource(HttpConnection paramHttpConnection, CacheRequest paramCacheRequest, long paramLong)
    throws IOException
  {
    super(paramHttpConnection, paramCacheRequest);
    bytesRemaining = paramLong;
    if (bytesRemaining == 0L) {
      endOfInput(true);
    }
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    if ((bytesRemaining != 0L) && (!this$0.discard(this, 100))) {
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
    if (bytesRemaining == 0L) {
      paramLong = -1L;
    }
    long l;
    do
    {
      return paramLong;
      l = HttpConnection.access$900(this$0).read(paramBuffer, Math.min(bytesRemaining, paramLong));
      if (l == -1L)
      {
        unexpectedEndOfInput();
        throw new ProtocolException("unexpected end of stream");
      }
      bytesRemaining -= l;
      cacheWrite(paramBuffer, l);
      paramLong = l;
    } while (bytesRemaining != 0L);
    endOfInput(true);
    return l;
  }
  
  public Timeout timeout()
  {
    return HttpConnection.access$900(this$0).timeout();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpConnection.FixedLengthSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */