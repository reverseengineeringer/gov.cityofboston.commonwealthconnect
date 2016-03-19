package com.google.common.hash;

import com.google.common.primitives.UnsignedInts;
import java.io.Serializable;

final class HashCode$IntHashCode
  extends HashCode
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final int hash;
  
  HashCode$IntHashCode(int paramInt)
  {
    hash = paramInt;
  }
  
  public byte[] asBytes()
  {
    return new byte[] { (byte)hash, (byte)(hash >> 8), (byte)(hash >> 16), (byte)(hash >> 24) };
  }
  
  public int asInt()
  {
    return hash;
  }
  
  public long asLong()
  {
    throw new IllegalStateException("this HashCode only has 32 bits; cannot create a long");
  }
  
  public int bits()
  {
    return 32;
  }
  
  public long padToLong()
  {
    return UnsignedInts.toLong(hash);
  }
  
  void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = 0;
    while (i < paramInt2)
    {
      paramArrayOfByte[(paramInt1 + i)] = ((byte)(hash >> i * 8));
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.HashCode.IntHashCode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */