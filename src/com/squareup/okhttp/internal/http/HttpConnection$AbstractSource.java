package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Connection;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.io.OutputStream;
import java.net.CacheRequest;
import java.net.Socket;
import okio.Buffer;

class HttpConnection$AbstractSource
{
  protected final OutputStream cacheBody;
  private final CacheRequest cacheRequest;
  protected boolean closed;
  
  HttpConnection$AbstractSource(HttpConnection paramHttpConnection, CacheRequest paramCacheRequest)
    throws IOException
  {
    if (paramCacheRequest != null) {}
    for (paramHttpConnection = paramCacheRequest.getBody();; paramHttpConnection = null)
    {
      if (paramHttpConnection == null) {
        paramCacheRequest = null;
      }
      cacheBody = paramHttpConnection;
      cacheRequest = paramCacheRequest;
      return;
    }
  }
  
  protected final void cacheWrite(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (cacheBody != null) {
      paramBuffer.copyTo(cacheBody, paramBuffer.size() - paramLong, paramLong);
    }
  }
  
  protected final void endOfInput(boolean paramBoolean)
    throws IOException
  {
    if (HttpConnection.access$300(this$0) != 5) {
      throw new IllegalStateException("state: " + HttpConnection.access$300(this$0));
    }
    if (cacheRequest != null) {
      cacheBody.close();
    }
    HttpConnection.access$302(this$0, 0);
    if ((paramBoolean) && (HttpConnection.access$600(this$0) == 1))
    {
      HttpConnection.access$602(this$0, 0);
      Internal.instance.recycle(HttpConnection.access$700(this$0), HttpConnection.access$800(this$0));
    }
    while (HttpConnection.access$600(this$0) != 2) {
      return;
    }
    HttpConnection.access$302(this$0, 6);
    HttpConnection.access$800(this$0).getSocket().close();
  }
  
  protected final void unexpectedEndOfInput()
  {
    if (cacheRequest != null) {
      cacheRequest.abort();
    }
    Util.closeQuietly(HttpConnection.access$800(this$0).getSocket());
    HttpConnection.access$302(this$0, 6);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpConnection.AbstractSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */