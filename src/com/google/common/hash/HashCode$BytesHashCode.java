package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;

final class HashCode$BytesHashCode
  extends HashCode
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final byte[] bytes;
  
  HashCode$BytesHashCode(byte[] paramArrayOfByte)
  {
    bytes = ((byte[])Preconditions.checkNotNull(paramArrayOfByte));
  }
  
  public byte[] asBytes()
  {
    return (byte[])bytes.clone();
  }
  
  public int asInt()
  {
    if (bytes.length >= 4) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "HashCode#asInt() requires >= 4 bytes (it only has %s bytes).", new Object[] { Integer.valueOf(bytes.length) });
      return bytes[0] & 0xFF | (bytes[1] & 0xFF) << 8 | (bytes[2] & 0xFF) << 16 | (bytes[3] & 0xFF) << 24;
    }
  }
  
  public long asLong()
  {
    if (bytes.length >= 8) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "HashCode#asLong() requires >= 8 bytes (it only has %s bytes).", new Object[] { Integer.valueOf(bytes.length) });
      return padToLong();
    }
  }
  
  public int bits()
  {
    return bytes.length * 8;
  }
  
  byte[] getBytesInternal()
  {
    return bytes;
  }
  
  public long padToLong()
  {
    long l = bytes[0] & 0xFF;
    int i = 1;
    while (i < Math.min(bytes.length, 8))
    {
      l |= (bytes[i] & 0xFF) << i * 8;
      i += 1;
    }
    return l;
  }
  
  void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    System.arraycopy(bytes, 0, paramArrayOfByte, paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.HashCode.BytesHashCode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */