package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.net.ProtocolException;
import okio.Buffer;
import okio.BufferedSink;
import okio.Sink;
import okio.Timeout;

final class HttpConnection$FixedLengthSink
  implements Sink
{
  private long bytesRemaining;
  private boolean closed;
  
  private HttpConnection$FixedLengthSink(HttpConnection paramHttpConnection, long paramLong)
  {
    bytesRemaining = paramLong;
  }
  
  public void close()
    throws IOException
  {
    if (closed) {
      return;
    }
    closed = true;
    if (bytesRemaining > 0L) {
      throw new ProtocolException("unexpected end of stream");
    }
    HttpConnection.access$302(this$0, 3);
  }
  
  public void flush()
    throws IOException
  {
    if (closed) {
      return;
    }
    HttpConnection.access$200(this$0).flush();
  }
  
  public Timeout timeout()
  {
    return HttpConnection.access$200(this$0).timeout();
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    if (closed) {
      throw new IllegalStateException("closed");
    }
    Util.checkOffsetAndCount(paramBuffer.size(), 0L, paramLong);
    if (paramLong > bytesRemaining) {
      throw new ProtocolException("expected " + bytesRemaining + " bytes but received " + paramLong);
    }
    HttpConnection.access$200(this$0).write(paramBuffer, paramLong);
    bytesRemaining -= paramLong;
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.http.HttpConnection.FixedLengthSink
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */