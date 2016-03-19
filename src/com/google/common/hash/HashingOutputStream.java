package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

@Beta
public final class HashingOutputStream
  extends FilterOutputStream
{
  private final Hasher hasher;
  
  public HashingOutputStream(HashFunction paramHashFunction, OutputStream paramOutputStream)
  {
    super((OutputStream)Preconditions.checkNotNull(paramOutputStream));
    hasher = ((Hasher)Preconditions.checkNotNull(paramHashFunction.newHasher()));
  }
  
  public void close()
    throws IOException
  {
    out.close();
  }
  
  public HashCode hash()
  {
    return hasher.hash();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    hasher.putByte((byte)paramInt);
    out.write(paramInt);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    hasher.putBytes(paramArrayOfByte, paramInt1, paramInt2);
    out.write(paramArrayOfByte, paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.HashingOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */