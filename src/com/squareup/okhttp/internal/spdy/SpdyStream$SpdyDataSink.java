package com.squareup.okhttp.internal.spdy;

import java.io.IOException;
import okio.Buffer;
import okio.Sink;
import okio.Timeout;

final class SpdyStream$SpdyDataSink
  implements Sink
{
  private boolean closed;
  private boolean finished;
  
  static
  {
    if (!SpdyStream.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  SpdyStream$SpdyDataSink(SpdyStream paramSpdyStream) {}
  
  public void close()
    throws IOException
  {
    assert (!Thread.holdsLock(this$0));
    synchronized (this$0)
    {
      if (closed) {
        return;
      }
      if (!this$0.sink.finished) {
        SpdyStream.access$500(this$0).writeData(SpdyStream.access$600(this$0), true, null, 0L);
      }
    }
    synchronized (this$0)
    {
      closed = true;
      SpdyStream.access$500(this$0).flush();
      SpdyStream.access$1000(this$0);
      return;
      localObject1 = finally;
      throw ((Throwable)localObject1);
    }
  }
  
  public void flush()
    throws IOException
  {
    assert (!Thread.holdsLock(this$0));
    synchronized (this$0)
    {
      SpdyStream.access$1200(this$0);
      SpdyStream.access$500(this$0).flush();
      return;
    }
  }
  
  public Timeout timeout()
  {
    return SpdyStream.access$1100(this$0);
  }
  
  public void write(Buffer paramBuffer, long paramLong)
    throws IOException
  {
    long l = paramLong;
    if (!$assertionsDisabled)
    {
      l = paramLong;
      if (Thread.holdsLock(this$0)) {
        throw new AssertionError();
      }
    }
    SpdyStream localSpdyStream1;
    try
    {
      SpdyStream.access$1100(this$0).exitAndThrowIfTimedOut();
      SpdyStream.access$1200(this$0);
      paramLong = Math.min(this$0.bytesLeftInWriteWindow, l);
      SpdyStream localSpdyStream2 = this$0;
      bytesLeftInWriteWindow -= paramLong;
      l -= paramLong;
      SpdyStream.access$500(this$0).writeData(SpdyStream.access$600(this$0), false, paramBuffer, paramLong);
      if (l > 0L)
      {
        localSpdyStream1 = this$0;
        SpdyStream.access$1100(this$0).enter();
      }
    }
    finally
    {
      try
      {
        for (;;)
        {
          if ((this$0.bytesLeftInWriteWindow <= 0L) && (!finished) && (!closed) && (SpdyStream.access$800(this$0) == null)) {
            SpdyStream.access$900(this$0);
          }
        }
      }
      finally
      {
        SpdyStream.access$1100(this$0).exitAndThrowIfTimedOut();
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyStream.SpdyDataSink
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */