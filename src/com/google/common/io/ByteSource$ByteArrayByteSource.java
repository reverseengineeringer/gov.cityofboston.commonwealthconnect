package com.google.common.io;

import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.hash.HashCode;
import com.google.common.hash.HashFunction;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

class ByteSource$ByteArrayByteSource
  extends ByteSource
{
  protected final byte[] bytes;
  
  protected ByteSource$ByteArrayByteSource(byte[] paramArrayOfByte)
  {
    bytes = ((byte[])Preconditions.checkNotNull(paramArrayOfByte));
  }
  
  public long copyTo(OutputStream paramOutputStream)
    throws IOException
  {
    paramOutputStream.write(bytes);
    return bytes.length;
  }
  
  public HashCode hash(HashFunction paramHashFunction)
    throws IOException
  {
    return paramHashFunction.hashBytes(bytes);
  }
  
  public boolean isEmpty()
  {
    return bytes.length == 0;
  }
  
  public InputStream openBufferedStream()
    throws IOException
  {
    return openStream();
  }
  
  public InputStream openStream()
  {
    return new ByteArrayInputStream(bytes);
  }
  
  public <T> T read(ByteProcessor<T> paramByteProcessor)
    throws IOException
  {
    paramByteProcessor.processBytes(bytes, 0, bytes.length);
    return (T)paramByteProcessor.getResult();
  }
  
  public byte[] read()
  {
    return (byte[])bytes.clone();
  }
  
  public long size()
  {
    return bytes.length;
  }
  
  public String toString()
  {
    return "ByteSource.wrap(" + Ascii.truncate(BaseEncoding.base16().encode(bytes), 30, "...") + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSource.ByteArrayByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */