package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.spdy.ErrorCode;
import com.squareup.okhttp.internal.spdy.SpdyStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.CacheRequest;
import java.util.concurrent.TimeUnit;
import okio.Buffer;
import okio.Source;
import okio.Timeout;

class SpdyTransport$SpdySource
  implements Source
{
  private final OutputStream cacheBody;
  private final CacheRequest cacheRequest;
  private boolean closed;
  private boolean inputExhausted;
  private final Source source;
  private final SpdyStream stream;
  
  SpdyTransport$SpdySource(SpdyStream paramSpdyStream, CacheRequest paramCacheRequest)
    throws IOException
  {
    stream = paramSpdyStream;
    source = paramSpdyStream.getSource();
    if (paramCacheRequest != null) {}
    for (paramSpdyStream = paramCacheRequest.getBody();; paramSpdyStream = null)
    {
      if (paramSpdyStream == null) {
        paramCacheRequest = null;
      }
      cacheBody = paramSpdyStream;
      cacheRequest = paramCacheRequest;
      return;
    }
  }
  
  private boolean discardStream()
  {
    long l = stream.readTimeout().timeoutNanos();
    stream.readTimeout().timeout(100L, TimeUnit.MILLISECONDS);
    try
    {
      Util.skipAll(this, 100);
      stream.readTimeout().timeout(l, TimeUnit.NANOSECONDS);
      return true;
    }
    catch (IOException localIOException)
    {
      localIOException = localIOException;
      stream.readTimeout().timeout(l, TimeUnit.NANOSECONDS);
      return false;
    }
    finally
    {
      localObject = finally;
      stream.readTimeout().timeout(l, TimeUnit.NANOSECONDS);
      throw ((Throwable)localObject);
    }
  }
  
  public void close()
    throws IOException
  {
    if (closed) {}
    do
    {
      do
      {
        return;
        if ((!inputExhausted) && (cacheBody != null)) {
          discardStream();
        }
        closed = true;
      } while (inputExhausted);
      stream.closeLater(ErrorCode.CANCEL);
    } while (cacheRequest == null);
    cacheRequest.abort();
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
      paramLong = -1L;
    }
    long l;
    do
    {
      return paramLong;
      l = source.read(paramBuffer, paramLong);
      if (l == -1L)
      {
        inputExhausted = true;
        if (cacheRequest != null) {
          cacheBody.close();
        }
        return -1L;
      }
      paramLong = l;
    } while (cacheBody == null);
    paramBuffer.copyTo(cacheBody, paramBuffer.size() - l, l);
    return l;
  }
  
  public Timeout timeout()
  {
    return source.timeout();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.SpdyTransport.SpdySource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */