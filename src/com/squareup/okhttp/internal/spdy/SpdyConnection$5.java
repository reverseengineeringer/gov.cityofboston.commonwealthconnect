package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.NamedRunnable;
import java.io.IOException;
import java.util.List;
import java.util.Set;

class SpdyConnection$5
  extends NamedRunnable
{
  SpdyConnection$5(SpdyConnection paramSpdyConnection, String paramString, Object[] paramArrayOfObject, int paramInt, List paramList, boolean paramVarArgs)
  {
    super(paramString, paramArrayOfObject);
  }
  
  public void execute()
  {
    boolean bool = SpdyConnection.access$2500(this$0).onHeaders(val$streamId, val$requestHeaders, val$inFinished);
    if (bool) {}
    try
    {
      this$0.frameWriter.rstStream(val$streamId, ErrorCode.CANCEL);
      if ((bool) || (val$inFinished)) {
        synchronized (this$0)
        {
          SpdyConnection.access$2600(this$0).remove(Integer.valueOf(val$streamId));
          return;
        }
      }
      return;
    }
    catch (IOException localIOException) {}
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */