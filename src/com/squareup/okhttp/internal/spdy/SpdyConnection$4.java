package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.NamedRunnable;
import java.io.IOException;
import java.util.List;
import java.util.Set;

class SpdyConnection$4
  extends NamedRunnable
{
  SpdyConnection$4(SpdyConnection paramSpdyConnection, String paramString, Object[] paramArrayOfObject, int paramInt, List paramVarArgs)
  {
    super(paramString, paramArrayOfObject);
  }
  
  public void execute()
  {
    if (SpdyConnection.access$2500(this$0).onRequest(val$streamId, val$requestHeaders)) {
      try
      {
        this$0.frameWriter.rstStream(val$streamId, ErrorCode.CANCEL);
        synchronized (this$0)
        {
          SpdyConnection.access$2600(this$0).remove(Integer.valueOf(val$streamId));
          return;
        }
        return;
      }
      catch (IOException localIOException) {}
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */