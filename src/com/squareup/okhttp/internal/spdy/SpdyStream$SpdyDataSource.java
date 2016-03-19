package com.squareup.okhttp.internal.spdy;

import java.io.EOFException;
import java.io.IOException;
import okio.Buffer;
import okio.BufferedSource;
import okio.Source;
import okio.Timeout;

final class SpdyStream$SpdyDataSource
  implements Source
{
  private boolean closed;
  private boolean finished;
  private final long maxByteCount;
  private final Buffer readBuffer = new Buffer();
  private final Buffer receiveBuffer = new Buffer();
  
  static
  {
    if (!SpdyStream.class.desiredAssertionStatus()) {}
    for (boolean bool = true;; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }
  
  private SpdyStream$SpdyDataSource(SpdyStream paramSpdyStream, long paramLong)
  {
    maxByteCount = paramLong;
  }
  
  private void checkNotClosed()
    throws IOException
  {
    if (closed) {
      throw new IOException("stream closed");
    }
    if (SpdyStream.access$800(this$0) != null) {
      throw new IOException("stream was reset: " + SpdyStream.access$800(this$0));
    }
  }
  
  /* Error */
  private void waitUntilReadable()
    throws IOException
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 35	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    //   4: invokestatic 92	com/squareup/okhttp/internal/spdy/SpdyStream:access$700	(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    //   7: invokevirtual 97	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout:enter	()V
    //   10: aload_0
    //   11: getfield 44	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:readBuffer	Lokio/Buffer;
    //   14: invokevirtual 101	okio/Buffer:size	()J
    //   17: lconst_0
    //   18: lcmp
    //   19: ifne +50 -> 69
    //   22: aload_0
    //   23: getfield 53	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:finished	Z
    //   26: ifne +43 -> 69
    //   29: aload_0
    //   30: getfield 58	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:closed	Z
    //   33: ifne +36 -> 69
    //   36: aload_0
    //   37: getfield 35	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    //   40: invokestatic 70	com/squareup/okhttp/internal/spdy/SpdyStream:access$800	(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/ErrorCode;
    //   43: ifnonnull +26 -> 69
    //   46: aload_0
    //   47: getfield 35	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    //   50: invokestatic 105	com/squareup/okhttp/internal/spdy/SpdyStream:access$900	(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)V
    //   53: goto -43 -> 10
    //   56: astore_1
    //   57: aload_0
    //   58: getfield 35	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    //   61: invokestatic 92	com/squareup/okhttp/internal/spdy/SpdyStream:access$700	(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    //   64: invokevirtual 108	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout:exitAndThrowIfTimedOut	()V
    //   67: aload_1
    //   68: athrow
    //   69: aload_0
    //   70: getfield 35	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyDataSource:this$0	Lcom/squareup/okhttp/internal/spdy/SpdyStream;
    //   73: invokestatic 92	com/squareup/okhttp/internal/spdy/SpdyStream:access$700	(Lcom/squareup/okhttp/internal/spdy/SpdyStream;)Lcom/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout;
    //   76: invokevirtual 108	com/squareup/okhttp/internal/spdy/SpdyStream$SpdyTimeout:exitAndThrowIfTimedOut	()V
    //   79: return
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	80	0	this	SpdyDataSource
    //   56	12	1	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   10	53	56	finally
  }
  
  public void close()
    throws IOException
  {
    synchronized (this$0)
    {
      closed = true;
      readBuffer.clear();
      this$0.notifyAll();
      SpdyStream.access$1000(this$0);
      return;
    }
  }
  
  public long read(Buffer arg1, long paramLong)
    throws IOException
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("byteCount < 0: " + paramLong);
    }
    synchronized (this$0)
    {
      waitUntilReadable();
      checkNotClosed();
      if (readBuffer.size() == 0L) {
        return -1L;
      }
      paramLong = readBuffer.read(???, Math.min(paramLong, readBuffer.size()));
      ??? = this$0;
      unacknowledgedBytesRead += paramLong;
      if (this$0.unacknowledgedBytesRead >= access$500this$0).okHttpSettings.getInitialWindowSize(65536) / 2)
      {
        SpdyStream.access$500(this$0).writeWindowUpdateLater(SpdyStream.access$600(this$0), this$0.unacknowledgedBytesRead);
        this$0.unacknowledgedBytesRead = 0L;
      }
      synchronized (SpdyStream.access$500(this$0))
      {
        ??? = SpdyStream.access$500(this$0);
        unacknowledgedBytesRead += paramLong;
        if (access$500this$0).unacknowledgedBytesRead >= access$500this$0).okHttpSettings.getInitialWindowSize(65536) / 2)
        {
          SpdyStream.access$500(this$0).writeWindowUpdateLater(0, access$500this$0).unacknowledgedBytesRead);
          access$500this$0).unacknowledgedBytesRead = 0L;
        }
        return paramLong;
      }
    }
  }
  
  void receive(BufferedSource paramBufferedSource, long paramLong)
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
    for (;;)
    {
      l -= paramLong;
      synchronized (this$0)
      {
        if (readBuffer.size() == 0L)
        {
          i = 1;
          readBuffer.writeAll(receiveBuffer);
          if (i != 0) {
            this$0.notifyAll();
          }
          if (l > 0L) {}
          boolean bool;
          synchronized (this$0)
          {
            bool = finished;
            if (readBuffer.size() + l > maxByteCount)
            {
              i = 1;
              if (i != 0)
              {
                paramBufferedSource.skip(l);
                this$0.closeLater(ErrorCode.FLOW_CONTROL_ERROR);
              }
            }
            else
            {
              i = 0;
            }
          }
          if (bool)
          {
            paramBufferedSource.skip(l);
            return;
          }
          paramLong = paramBufferedSource.read(receiveBuffer, l);
          if (paramLong != -1L) {
            continue;
          }
          throw new EOFException();
        }
        int i = 0;
      }
    }
  }
  
  public Timeout timeout()
  {
    return SpdyStream.access$700(this$0);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyStream.SpdyDataSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */