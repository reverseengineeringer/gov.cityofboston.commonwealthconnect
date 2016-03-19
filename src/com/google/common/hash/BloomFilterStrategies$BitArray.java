package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.math.LongMath;
import com.google.common.primitives.Ints;
import java.math.RoundingMode;
import java.util.Arrays;

final class BloomFilterStrategies$BitArray
{
  long bitCount;
  final long[] data;
  
  BloomFilterStrategies$BitArray(long paramLong)
  {
    this(new long[Ints.checkedCast(LongMath.divide(paramLong, 64L, RoundingMode.CEILING))]);
  }
  
  BloomFilterStrategies$BitArray(long[] paramArrayOfLong)
  {
    if (paramArrayOfLong.length > 0) {}
    long l;
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "data length is zero!");
      data = paramArrayOfLong;
      l = 0L;
      int j = paramArrayOfLong.length;
      int i = 0;
      while (i < j)
      {
        l += Long.bitCount(paramArrayOfLong[i]);
        i += 1;
      }
    }
    bitCount = l;
  }
  
  long bitCount()
  {
    return bitCount;
  }
  
  long bitSize()
  {
    return data.length * 64L;
  }
  
  BitArray copy()
  {
    return new BitArray((long[])data.clone());
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof BitArray))
    {
      paramObject = (BitArray)paramObject;
      return Arrays.equals(data, data);
    }
    return false;
  }
  
  boolean get(long paramLong)
  {
    return (data[((int)(paramLong >>> 6))] & 1L << (int)paramLong) != 0L;
  }
  
  public int hashCode()
  {
    return Arrays.hashCode(data);
  }
  
  void putAll(BitArray paramBitArray)
  {
    if (data.length == data.length) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "BitArrays must be of equal length (%s != %s)", new Object[] { Integer.valueOf(data.length), Integer.valueOf(data.length) });
      bitCount = 0L;
      int i = 0;
      while (i < data.length)
      {
        long[] arrayOfLong = data;
        arrayOfLong[i] |= data[i];
        bitCount += Long.bitCount(data[i]);
        i += 1;
      }
    }
  }
  
  boolean set(long paramLong)
  {
    if (!get(paramLong))
    {
      long[] arrayOfLong = data;
      int i = (int)(paramLong >>> 6);
      arrayOfLong[i] |= 1L << (int)paramLong;
      bitCount += 1L;
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.BloomFilterStrategies.BitArray
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */