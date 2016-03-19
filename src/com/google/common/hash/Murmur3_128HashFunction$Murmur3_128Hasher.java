package com.google.common.hash;

import com.google.common.primitives.UnsignedBytes;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

final class Murmur3_128HashFunction$Murmur3_128Hasher
  extends AbstractStreamingHashFunction.AbstractStreamingHasher
{
  private static final long C1 = -8663945395140668459L;
  private static final long C2 = 5545529020109919103L;
  private static final int CHUNK_SIZE = 16;
  private long h1;
  private long h2;
  private int length;
  
  Murmur3_128HashFunction$Murmur3_128Hasher(int paramInt)
  {
    super(16);
    h1 = paramInt;
    h2 = paramInt;
    length = 0;
  }
  
  private void bmix64(long paramLong1, long paramLong2)
  {
    h1 ^= mixK1(paramLong1);
    h1 = Long.rotateLeft(h1, 27);
    h1 += h2;
    h1 = (h1 * 5L + 1390208809L);
    h2 ^= mixK2(paramLong2);
    h2 = Long.rotateLeft(h2, 31);
    h2 += h1;
    h2 = (h2 * 5L + 944331445L);
  }
  
  private static long fmix64(long paramLong)
  {
    paramLong = (paramLong ^ paramLong >>> 33) * -49064778989728563L;
    paramLong = (paramLong ^ paramLong >>> 33) * -4265267296055464877L;
    return paramLong ^ paramLong >>> 33;
  }
  
  private static long mixK1(long paramLong)
  {
    return Long.rotateLeft(paramLong * -8663945395140668459L, 31) * 5545529020109919103L;
  }
  
  private static long mixK2(long paramLong)
  {
    return Long.rotateLeft(paramLong * 5545529020109919103L, 33) * -8663945395140668459L;
  }
  
  public HashCode makeHash()
  {
    h1 ^= length;
    h2 ^= length;
    h1 += h2;
    h2 += h1;
    h1 = fmix64(h1);
    h2 = fmix64(h2);
    h1 += h2;
    h2 += h1;
    return HashCode.fromBytesNoCopy(ByteBuffer.wrap(new byte[16]).order(ByteOrder.LITTLE_ENDIAN).putLong(h1).putLong(h2).array());
  }
  
  protected void process(ByteBuffer paramByteBuffer)
  {
    bmix64(paramByteBuffer.getLong(), paramByteBuffer.getLong());
    length += 16;
  }
  
  protected void processRemaining(ByteBuffer paramByteBuffer)
  {
    long l2 = 0L;
    long l1 = 0L;
    length += paramByteBuffer.remaining();
    long l4 = l1;
    long l5 = l1;
    long l6 = l1;
    long l7 = l1;
    long l8 = l1;
    long l9 = l1;
    long l3 = l1;
    long l10 = l2;
    long l11 = l2;
    long l12 = l2;
    long l13 = l2;
    long l14 = l2;
    switch (paramByteBuffer.remaining())
    {
    default: 
      throw new AssertionError("Should never get here.");
    case 15: 
      l4 = 0L ^ UnsignedBytes.toInt(paramByteBuffer.get(14)) << 48;
    case 14: 
      l5 = l4 ^ UnsignedBytes.toInt(paramByteBuffer.get(13)) << 40;
    case 13: 
      l6 = l5 ^ UnsignedBytes.toInt(paramByteBuffer.get(12)) << 32;
    case 12: 
      l7 = l6 ^ UnsignedBytes.toInt(paramByteBuffer.get(11)) << 24;
    case 11: 
      l8 = l7 ^ UnsignedBytes.toInt(paramByteBuffer.get(10)) << 16;
    case 10: 
      l9 = l8 ^ UnsignedBytes.toInt(paramByteBuffer.get(9)) << 8;
    case 9: 
      l3 = l9 ^ UnsignedBytes.toInt(paramByteBuffer.get(8));
    case 8: 
      l2 = 0L ^ paramByteBuffer.getLong();
      l1 = l3;
    }
    for (;;)
    {
      h1 ^= mixK1(l2);
      h2 ^= mixK2(l1);
      return;
      l10 = 0L ^ UnsignedBytes.toInt(paramByteBuffer.get(6)) << 48;
      l11 = l10 ^ UnsignedBytes.toInt(paramByteBuffer.get(5)) << 40;
      l12 = l11 ^ UnsignedBytes.toInt(paramByteBuffer.get(4)) << 32;
      l13 = l12 ^ UnsignedBytes.toInt(paramByteBuffer.get(3)) << 24;
      l14 = l13 ^ UnsignedBytes.toInt(paramByteBuffer.get(2)) << 16;
      l2 = l14 ^ UnsignedBytes.toInt(paramByteBuffer.get(1)) << 8;
      l2 ^= UnsignedBytes.toInt(paramByteBuffer.get(0));
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Murmur3_128HashFunction.Murmur3_128Hasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */