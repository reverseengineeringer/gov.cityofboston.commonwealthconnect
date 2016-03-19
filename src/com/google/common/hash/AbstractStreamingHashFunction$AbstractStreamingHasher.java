package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public abstract class AbstractStreamingHashFunction$AbstractStreamingHasher
  extends AbstractHasher
{
  private final ByteBuffer buffer;
  private final int bufferSize;
  private final int chunkSize;
  
  protected AbstractStreamingHashFunction$AbstractStreamingHasher(int paramInt)
  {
    this(paramInt, paramInt);
  }
  
  protected AbstractStreamingHashFunction$AbstractStreamingHasher(int paramInt1, int paramInt2)
  {
    if (paramInt2 % paramInt1 == 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      buffer = ByteBuffer.allocate(paramInt2 + 7).order(ByteOrder.LITTLE_ENDIAN);
      bufferSize = paramInt2;
      chunkSize = paramInt1;
      return;
    }
  }
  
  private void munch()
  {
    buffer.flip();
    while (buffer.remaining() >= chunkSize) {
      process(buffer);
    }
    buffer.compact();
  }
  
  private void munchIfFull()
  {
    if (buffer.remaining() < 8) {
      munch();
    }
  }
  
  private Hasher putBytes(ByteBuffer paramByteBuffer)
  {
    if (paramByteBuffer.remaining() <= buffer.remaining())
    {
      buffer.put(paramByteBuffer);
      munchIfFull();
      return this;
    }
    int j = bufferSize;
    int k = buffer.position();
    int i = 0;
    while (i < j - k)
    {
      buffer.put(paramByteBuffer.get());
      i += 1;
    }
    munch();
    while (paramByteBuffer.remaining() >= chunkSize) {
      process(paramByteBuffer);
    }
    buffer.put(paramByteBuffer);
    return this;
  }
  
  public final HashCode hash()
  {
    munch();
    buffer.flip();
    if (buffer.remaining() > 0) {
      processRemaining(buffer);
    }
    return makeHash();
  }
  
  abstract HashCode makeHash();
  
  protected abstract void process(ByteBuffer paramByteBuffer);
  
  protected void processRemaining(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.position(paramByteBuffer.limit());
    paramByteBuffer.limit(chunkSize + 7);
    while (paramByteBuffer.position() < chunkSize) {
      paramByteBuffer.putLong(0L);
    }
    paramByteBuffer.limit(chunkSize);
    paramByteBuffer.flip();
    process(paramByteBuffer);
  }
  
  public final Hasher putByte(byte paramByte)
  {
    buffer.put(paramByte);
    munchIfFull();
    return this;
  }
  
  public final Hasher putBytes(byte[] paramArrayOfByte)
  {
    return putBytes(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public final Hasher putBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return putBytes(ByteBuffer.wrap(paramArrayOfByte, paramInt1, paramInt2).order(ByteOrder.LITTLE_ENDIAN));
  }
  
  public final Hasher putChar(char paramChar)
  {
    buffer.putChar(paramChar);
    munchIfFull();
    return this;
  }
  
  public final Hasher putInt(int paramInt)
  {
    buffer.putInt(paramInt);
    munchIfFull();
    return this;
  }
  
  public final Hasher putLong(long paramLong)
  {
    buffer.putLong(paramLong);
    munchIfFull();
    return this;
  }
  
  public final <T> Hasher putObject(T paramT, Funnel<? super T> paramFunnel)
  {
    paramFunnel.funnel(paramT, this);
    return this;
  }
  
  public final Hasher putShort(short paramShort)
  {
    buffer.putShort(paramShort);
    munchIfFull();
    return this;
  }
  
  public final Hasher putUnencodedChars(CharSequence paramCharSequence)
  {
    int i = 0;
    while (i < paramCharSequence.length())
    {
      putChar(paramCharSequence.charAt(i));
      i += 1;
    }
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.AbstractStreamingHashFunction.AbstractStreamingHasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */