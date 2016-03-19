package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.NamedRunnable;
import java.util.Set;

class SpdyConnection$7
  extends NamedRunnable
{
  SpdyConnection$7(SpdyConnection paramSpdyConnection, String paramString, Object[] paramArrayOfObject, int paramInt, ErrorCode paramVarArgs)
  {
    super(paramString, paramArrayOfObject);
  }
  
  public void execute()
  {
    SpdyConnection.access$2500(this$0).onReset(val$streamId, val$errorCode);
    synchronized (this$0)
    {
      SpdyConnection.access$2600(this$0).remove(Integer.valueOf(val$streamId));
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */