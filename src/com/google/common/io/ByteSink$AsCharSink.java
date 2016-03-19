package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

final class ByteSink$AsCharSink
  extends CharSink
{
  private final Charset charset;
  
  private ByteSink$AsCharSink(ByteSink paramByteSink, Charset paramCharset)
  {
    charset = ((Charset)Preconditions.checkNotNull(paramCharset));
  }
  
  public Writer openStream()
    throws IOException
  {
    return new OutputStreamWriter(this$0.openStream(), charset);
  }
  
  public String toString()
  {
    return this$0.toString() + ".asCharSink(" + charset + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSink.AsCharSink
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */