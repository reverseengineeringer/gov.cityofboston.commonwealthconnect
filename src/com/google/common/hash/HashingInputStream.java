package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

@Beta
public final class HashingInputStream
  extends FilterInputStream
{
  private final Hasher hasher;
  
  public HashingInputStream(HashFunction paramHashFunction, InputStream paramInputStream)
  {
    super((InputStream)Preconditions.checkNotNull(paramInputStream));
    hasher = ((Hasher)Preconditions.checkNotNull(paramHashFunction.newHasher()));
  }
  
  public HashCode hash()
  {
    return hasher.hash();
  }
  
  public void mark(int paramInt) {}
  
  public boolean markSupported()
  {
    return false;
  }
  
  public int read()
    throws IOException
  {
    int i = in.read();
    if (i != -1) {
      hasher.putByte((byte)i);
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt2 = in.read(paramArrayOfByte, paramInt1, paramInt2);
    if (paramInt2 != -1) {
      hasher.putBytes(paramArrayOfByte, paramInt1, paramInt2);
    }
    return paramInt2;
  }
  
  public void reset()
    throws IOException
  {
    throw new IOException("reset not supported");
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.HashingInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */