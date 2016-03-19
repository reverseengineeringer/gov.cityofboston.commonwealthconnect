package com.squareup.okhttp.internal.spdy;

import com.squareup.okhttp.internal.NamedRunnable;
import java.io.IOException;

class SpdyConnection$Reader$2
  extends NamedRunnable
{
  SpdyConnection$Reader$2(SpdyConnection.Reader paramReader, String paramString, Object... paramVarArgs)
  {
    super(paramString, paramVarArgs);
  }
  
  public void execute()
  {
    try
    {
      this$1.this$0.frameWriter.ackSettings();
      return;
    }
    catch (IOException localIOException) {}
  }
}

/* Location:
 * Qualified Name:     com.squareup.okhttp.internal.spdy.SpdyConnection.Reader.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */