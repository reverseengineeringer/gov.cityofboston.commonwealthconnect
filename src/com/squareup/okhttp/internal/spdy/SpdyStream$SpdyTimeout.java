package com.squareup.okhttp.internal.spdy;

import java.io.InterruptedIOException;
import okio.AsyncTimeout;

class SpdyStream$SpdyTimeout
  extends AsyncTimeout
{
  SpdyStream$SpdyTimeout(SpdyStream paramSpdyStream) {}
  
  public void exitAndThrowIfTimedOut()
    throws InterruptedIOException
  {
    if (exit()) {
      throw new InterruptedIOException("timeout");
    }
  }
  
  protected void timedOut()
  {
    this$0.closeLater(ErrorCode.CANCEL);
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyStream.SpdyTimeout
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */