package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.charset.Charset;

final class ByteSource$AsCharSource
  extends CharSource
{
  private final Charset charset;
  
  private ByteSource$AsCharSource(ByteSource paramByteSource, Charset paramCharset)
  {
    charset = ((Charset)Preconditions.checkNotNull(paramCharset));
  }
  
  public Reader openStream()
    throws IOException
  {
    return new InputStreamReader(this$0.openStream(), charset);
  }
  
  public String toString()
  {
    return this$0.toString() + ".asCharSource(" + charset + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSource.AsCharSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */