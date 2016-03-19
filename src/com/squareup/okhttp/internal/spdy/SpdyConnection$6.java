package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.NamedRunnable;
import java.io.IOException;
import java.util.Set;
import okio.Buffer;

class SpdyConnection$6
  extends NamedRunnable
{
  SpdyConnection$6(SpdyConnection paramSpdyConnection, String paramString, Object[] paramArrayOfObject, int paramInt1, Buffer paramBuffer, int paramInt2, boolean paramVarArgs)
  {
    super(paramString, paramArrayOfObject);
  }
  
  public void execute()
  {
    try
    {
      boolean bool = SpdyConnection.access$2500(this$0).onData(val$streamId, val$buffer, val$byteCount, val$inFinished);
      if (bool) {
        this$0.frameWriter.rstStream(val$streamId, ErrorCode.CANCEL);
      }
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
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.6
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */