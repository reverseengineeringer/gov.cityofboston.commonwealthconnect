package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Headers.Builder;
import java.io.IOException;
import java.net.CacheRequest;
import java.net.ProtocolException;
import okio.Buffer;
import okio.BufferedSource;
import okio.Source;
import okio.Timeout;

class HttpConnection$ChunkedSource
  extends HttpConnection.AbstractSource
  implements Source
{
  private static final int NO_CHUNK_YET = -1;
  private int bytesRemainingInChunk = -1;
  private boolean hasMoreChunks = true;
  private final HttpEngine httpEngine;
  
  HttpConnection$ChunkedSource(HttpConnection paramHttpConnection, CacheRequest paramCacheRequest, HttpEngine paramHttpEngine)
    throws IOException
  {
    super(paramHttpConnection, paramCacheRequest);
    httpEngine = paramHttpEngine;
  }
  
  private void readChunkSize()
    throws IOException
  {
    if (bytesRemainingInChunk != -1) {
      HttpConnection.access$900(this$0).readUtf8LineStrict();
    }
    String str = HttpConnection.access$900(this$0).readUtf8LineStrict();
    int i = str.indexOf(";");
    Object localObject = str;
    if (i != -1) {
      localObject = str.substring(0, i);
    }
    try
    {
      bytesRemainingInChunk = Integer.parseInt(((String)localObject).trim(), 16);
      if (bytesRemainingInChunk == 0)
      {
        hasMoreChunks = false;
        localObject = new Headers.Builder();
        this$0.readHeaders((Headers.Builder)localObject);
        httpEngine.receiveHeaders(((Headers.Builder)localObject).build());
        endOfInput(true);
      }
      return;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      throw new ProtocolException("Expected a hex chunk size but was " + (String)localObject);
    }
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    if ((hasMoreChunks) && (!this$0.discard(this, 100))) {
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
    if (!hasMoreChunks) {
      return -1L;
    }
    if ((bytesRemainingInChunk == 0) || (bytesRemainingInChunk == -1))
    {
      readChunkSize();
      if (!hasMoreChunks) {
        return -1L;
      }
    }
    paramLong = HttpConnection.access$900(this$0).read(paramBuffer, Math.min(paramLong, bytesRemainingInChunk));
    if (paramLong == -1L)
    {
      unexpectedEndOfInput();
      throw new IOException("unexpected end of stream");
    }
    bytesRemainingInChunk = ((int)(bytesRemainingInChunk - paramLong));
    cacheWrite(paramBuffer, paramLong);
    return paramLong;
  }
  
  public Timeout timeout()
  {
    return HttpConnection.access$900(this$0).timeout();
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpConnection.ChunkedSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */