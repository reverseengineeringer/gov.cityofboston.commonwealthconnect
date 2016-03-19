package com.google.common.io;

import com.google.common.base.Preconditions;
import java.nio.charset.Charset;

final class ByteSource$EmptyByteSource
  extends ByteSource.ByteArrayByteSource
{
  private static final EmptyByteSource INSTANCE = new EmptyByteSource();
  
  private ByteSource$EmptyByteSource()
  {
    super(new byte[0]);
  }
  
  public CharSource asCharSource(Charset paramCharset)
  {
    Preconditions.checkNotNull(paramCharset);
    return CharSource.empty();
  }
  
  public byte[] read()
  {
    return bytes;
  }
  
  public String toString()
  {
    return "ByteSource.empty()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSource.EmptyByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */