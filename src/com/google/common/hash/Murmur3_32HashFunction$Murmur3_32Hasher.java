package com.google.common.hash;

import com.google.common.primitives.UnsignedBytes;
import java.nio.ByteBuffer;

final class Murmur3_32HashFunction$Murmur3_32Hasher
  extends AbstractStreamingHashFunction.AbstractStreamingHasher
{
  private static final int CHUNK_SIZE = 4;
  private int h1;
  private int length;
  
  Murmur3_32HashFunction$Murmur3_32Hasher(int paramInt)
  {
    super(4);
    h1 = paramInt;
    length = 0;
  }
  
  public HashCode makeHash()
  {
    return Murmur3_32HashFunction.access$200(h1, length);
  }
  
  protected void process(ByteBuffer paramByteBuffer)
  {
    int i = Murmur3_32HashFunction.access$000(paramByteBuffer.getInt());
    h1 = Murmur3_32HashFunction.access$100(h1, i);
    length += 4;
  }
  
  protected void processRemaining(ByteBuffer paramByteBuffer)
  {
    length += paramByteBuffer.remaining();
    int j = 0;
    int i = 0;
    while (paramByteBuffer.hasRemaining())
    {
      j ^= UnsignedBytes.toInt(paramByteBuffer.get()) << i;
      i += 8;
    }
    h1 ^= Murmur3_32HashFunction.access$000(j);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Murmur3_32HashFunction.Murmur3_32Hasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */