package com.google.common.hash;

import java.io.IOException;

final class AbstractNonStreamingHashFunction$BufferingHasher
  extends AbstractHasher
{
  static final int BOTTOM_BYTE = 255;
  final AbstractNonStreamingHashFunction.ExposedByteArrayOutputStream stream;
  
  AbstractNonStreamingHashFunction$BufferingHasher(AbstractNonStreamingHashFunction paramAbstractNonStreamingHashFunction, int paramInt)
  {
    stream = new AbstractNonStreamingHashFunction.ExposedByteArrayOutputStream(paramInt);
  }
  
  public HashCode hash()
  {
    return this$0.hashBytes(stream.byteArray(), 0, stream.length());
  }
  
  public Hasher putByte(byte paramByte)
  {
    stream.write(paramByte);
    return this;
  }
  
  public Hasher putBytes(byte[] paramArrayOfByte)
  {
    try
    {
      stream.write(paramArrayOfByte);
      return this;
    }
    catch (IOException paramArrayOfByte)
    {
      throw new RuntimeException(paramArrayOfByte);
    }
  }
  
  public Hasher putBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    stream.write(paramArrayOfByte, paramInt1, paramInt2);
    return this;
  }
  
  public Hasher putChar(char paramChar)
  {
    stream.write(paramChar & 0xFF);
    stream.write(paramChar >>> '\b' & 0xFF);
    return this;
  }
  
  public Hasher putInt(int paramInt)
  {
    stream.write(paramInt & 0xFF);
    stream.write(paramInt >>> 8 & 0xFF);
    stream.write(paramInt >>> 16 & 0xFF);
    stream.write(paramInt >>> 24 & 0xFF);
    return this;
  }
  
  public Hasher putLong(long paramLong)
  {
    int i = 0;
    while (i < 64)
    {
      stream.write((byte)(int)(paramLong >>> i & 0xFF));
      i += 8;
    }
    return this;
  }
  
  public <T> Hasher putObject(T paramT, Funnel<? super T> paramFunnel)
  {
    paramFunnel.funnel(paramT, this);
    return this;
  }
  
  public Hasher putShort(short paramShort)
  {
    stream.write(paramShort & 0xFF);
    stream.write(paramShort >>> 8 & 0xFF);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.AbstractNonStreamingHashFunction.BufferingHasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */