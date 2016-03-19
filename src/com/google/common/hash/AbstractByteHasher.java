package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

abstract class AbstractByteHasher
  extends AbstractHasher
{
  private final ByteBuffer scratch = ByteBuffer.allocate(8).order(ByteOrder.LITTLE_ENDIAN);
  
  private Hasher update(int paramInt)
  {
    try
    {
      update(scratch.array(), 0, paramInt);
      return this;
    }
    finally
    {
      scratch.clear();
    }
  }
  
  public Hasher putByte(byte paramByte)
  {
    update(paramByte);
    return this;
  }
  
  public Hasher putBytes(byte[] paramArrayOfByte)
  {
    Preconditions.checkNotNull(paramArrayOfByte);
    update(paramArrayOfByte);
    return this;
  }
  
  public Hasher putBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfByte.length);
    update(paramArrayOfByte, paramInt1, paramInt2);
    return this;
  }
  
  public Hasher putChar(char paramChar)
  {
    scratch.putChar(paramChar);
    return update(2);
  }
  
  public Hasher putInt(int paramInt)
  {
    scratch.putInt(paramInt);
    return update(4);
  }
  
  public Hasher putLong(long paramLong)
  {
    scratch.putLong(paramLong);
    return update(8);
  }
  
  public <T> Hasher putObject(T paramT, Funnel<? super T> paramFunnel)
  {
    paramFunnel.funnel(paramT, this);
    return this;
  }
  
  public Hasher putShort(short paramShort)
  {
    scratch.putShort(paramShort);
    return update(2);
  }
  
  protected abstract void update(byte paramByte);
  
  protected void update(byte[] paramArrayOfByte)
  {
    update(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  protected void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = paramInt1;
    while (i < paramInt1 + paramInt2)
    {
      update(paramArrayOfByte[i]);
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.AbstractByteHasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */