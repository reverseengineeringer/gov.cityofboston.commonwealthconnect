package com.google.common.hash;

import java.io.Serializable;

final class HashCode$LongHashCode
  extends HashCode
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final long hash;
  
  HashCode$LongHashCode(long paramLong)
  {
    hash = paramLong;
  }
  
  public byte[] asBytes()
  {
    return new byte[] { (byte)(int)hash, (byte)(int)(hash >> 8), (byte)(int)(hash >> 16), (byte)(int)(hash >> 24), (byte)(int)(hash >> 32), (byte)(int)(hash >> 40), (byte)(int)(hash >> 48), (byte)(int)(hash >> 56) };
  }
  
  public int asInt()
  {
    return (int)hash;
  }
  
  public long asLong()
  {
    return hash;
  }
  
  public int bits()
  {
    return 64;
  }
  
  public long padToLong()
  {
    return hash;
  }
  
  void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = 0;
    while (i < paramInt2)
    {
      paramArrayOfByte[(paramInt1 + i)] = ((byte)(int)(hash >> i * 8));
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.HashCode.LongHashCode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */