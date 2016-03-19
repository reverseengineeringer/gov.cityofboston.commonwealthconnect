package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import com.google.common.primitives.UnsignedInts;
import java.io.Serializable;
import java.security.MessageDigest;
import javax.annotation.Nullable;

@Beta
public abstract class HashCode
{
  private static final char[] hexDigits = "0123456789abcdef".toCharArray();
  
  private static int decode(char paramChar)
  {
    if ((paramChar >= '0') && (paramChar <= '9')) {
      return paramChar - '0';
    }
    if ((paramChar >= 'a') && (paramChar <= 'f')) {
      return paramChar - 'a' + 10;
    }
    throw new IllegalArgumentException("Illegal hexadecimal character: " + paramChar);
  }
  
  public static HashCode fromBytes(byte[] paramArrayOfByte)
  {
    boolean bool = true;
    if (paramArrayOfByte.length >= 1) {}
    for (;;)
    {
      Preconditions.checkArgument(bool, "A HashCode must contain at least 1 byte.");
      return fromBytesNoCopy((byte[])paramArrayOfByte.clone());
      bool = false;
    }
  }
  
  static HashCode fromBytesNoCopy(byte[] paramArrayOfByte)
  {
    return new BytesHashCode(paramArrayOfByte);
  }
  
  public static HashCode fromInt(int paramInt)
  {
    return new IntHashCode(paramInt);
  }
  
  public static HashCode fromLong(long paramLong)
  {
    return new LongHashCode(paramLong);
  }
  
  public static HashCode fromString(String paramString)
  {
    if (paramString.length() >= 2)
    {
      bool = true;
      Preconditions.checkArgument(bool, "input string (%s) must have at least 2 characters", new Object[] { paramString });
      if (paramString.length() % 2 != 0) {
        break label118;
      }
    }
    byte[] arrayOfByte;
    label118:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "input string (%s) must have an even number of characters", new Object[] { paramString });
      arrayOfByte = new byte[paramString.length() / 2];
      int i = 0;
      while (i < paramString.length())
      {
        int j = decode(paramString.charAt(i));
        int k = decode(paramString.charAt(i + 1));
        arrayOfByte[(i / 2)] = ((byte)((j << 4) + k));
        i += 2;
      }
      bool = false;
      break;
    }
    return fromBytesNoCopy(arrayOfByte);
  }
  
  public abstract byte[] asBytes();
  
  public abstract int asInt();
  
  public abstract long asLong();
  
  public abstract int bits();
  
  public final boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof HashCode))
    {
      paramObject = (HashCode)paramObject;
      return MessageDigest.isEqual(asBytes(), ((HashCode)paramObject).asBytes());
    }
    return false;
  }
  
  byte[] getBytesInternal()
  {
    return asBytes();
  }
  
  public final int hashCode()
  {
    int k;
    if (bits() >= 32)
    {
      k = asInt();
      return k;
    }
    byte[] arrayOfByte = asBytes();
    int i = arrayOfByte[0] & 0xFF;
    int j = 1;
    for (;;)
    {
      k = i;
      if (j >= arrayOfByte.length) {
        break;
      }
      i |= (arrayOfByte[j] & 0xFF) << j * 8;
      j += 1;
    }
  }
  
  public abstract long padToLong();
  
  public final String toString()
  {
    byte[] arrayOfByte = asBytes();
    StringBuilder localStringBuilder = new StringBuilder(arrayOfByte.length * 2);
    int j = arrayOfByte.length;
    int i = 0;
    while (i < j)
    {
      int k = arrayOfByte[i];
      localStringBuilder.append(hexDigits[(k >> 4 & 0xF)]).append(hexDigits[(k & 0xF)]);
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public int writeBytesTo(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    paramInt2 = Ints.min(new int[] { paramInt2, bits() / 8 });
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfByte.length);
    writeBytesToImpl(paramArrayOfByte, paramInt1, paramInt2);
    return paramInt2;
  }
  
  abstract void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2);
  
  private static final class BytesHashCode
    extends HashCode
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final byte[] bytes;
    
    BytesHashCode(byte[] paramArrayOfByte)
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
  
  private static final class IntHashCode
    extends HashCode
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final int hash;
    
    IntHashCode(int paramInt)
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
  
  private static final class LongHashCode
    extends HashCode
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    final long hash;
    
    LongHashCode(long paramLong)
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
}

/* Location:
 * Qualified Name:     com.google.common.hash.HashCode
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */