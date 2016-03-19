package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.nio.ByteBuffer;
import javax.annotation.Nullable;

final class SipHashFunction
  extends AbstractStreamingHashFunction
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final int c;
  private final int d;
  private final long k0;
  private final long k1;
  
  SipHashFunction(int paramInt1, int paramInt2, long paramLong1, long paramLong2)
  {
    if (paramInt1 > 0)
    {
      bool = true;
      Preconditions.checkArgument(bool, "The number of SipRound iterations (c=%s) during Compression must be positive.", new Object[] { Integer.valueOf(paramInt1) });
      if (paramInt2 <= 0) {
        break label82;
      }
    }
    label82:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "The number of SipRound iterations (d=%s) during Finalization must be positive.", new Object[] { Integer.valueOf(paramInt2) });
      c = paramInt1;
      d = paramInt2;
      k0 = paramLong1;
      k1 = paramLong2;
      return;
      bool = false;
      break;
    }
  }
  
  public int bits()
  {
    return 64;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof SipHashFunction))
    {
      paramObject = (SipHashFunction)paramObject;
      bool1 = bool2;
      if (c == c)
      {
        bool1 = bool2;
        if (d == d)
        {
          bool1 = bool2;
          if (k0 == k0)
          {
            bool1 = bool2;
            if (k1 == k1) {
              bool1 = true;
            }
          }
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return (int)(getClass().hashCode() ^ c ^ d ^ k0 ^ k1);
  }
  
  public Hasher newHasher()
  {
    return new SipHasher(c, d, k0, k1);
  }
  
  public String toString()
  {
    return "Hashing.sipHash" + c + "" + d + "(" + k0 + ", " + k1 + ")";
  }
  
  private static final class SipHasher
    extends AbstractStreamingHashFunction.AbstractStreamingHasher
  {
    private static final int CHUNK_SIZE = 8;
    private long b = 0L;
    private final int c;
    private final int d;
    private long finalM = 0L;
    private long v0 = 8317987319222330741L;
    private long v1 = 7237128888997146477L;
    private long v2 = 7816392313619706465L;
    private long v3 = 8387220255154660723L;
    
    SipHasher(int paramInt1, int paramInt2, long paramLong1, long paramLong2)
    {
      super();
      c = paramInt1;
      d = paramInt2;
      v0 ^= paramLong1;
      v1 ^= paramLong2;
      v2 ^= paramLong1;
      v3 ^= paramLong2;
    }
    
    private void processM(long paramLong)
    {
      v3 ^= paramLong;
      sipRound(c);
      v0 ^= paramLong;
    }
    
    private void sipRound(int paramInt)
    {
      int i = 0;
      while (i < paramInt)
      {
        v0 += v1;
        v2 += v3;
        v1 = Long.rotateLeft(v1, 13);
        v3 = Long.rotateLeft(v3, 16);
        v1 ^= v0;
        v3 ^= v2;
        v0 = Long.rotateLeft(v0, 32);
        v2 += v1;
        v0 += v3;
        v1 = Long.rotateLeft(v1, 17);
        v3 = Long.rotateLeft(v3, 21);
        v1 ^= v2;
        v3 ^= v0;
        v2 = Long.rotateLeft(v2, 32);
        i += 1;
      }
    }
    
    public HashCode makeHash()
    {
      finalM ^= b << 56;
      processM(finalM);
      v2 ^= 0xFF;
      sipRound(d);
      return HashCode.fromLong(v0 ^ v1 ^ v2 ^ v3);
    }
    
    protected void process(ByteBuffer paramByteBuffer)
    {
      b += 8L;
      processM(paramByteBuffer.getLong());
    }
    
    protected void processRemaining(ByteBuffer paramByteBuffer)
    {
      b += paramByteBuffer.remaining();
      int i = 0;
      while (paramByteBuffer.hasRemaining())
      {
        finalM ^= (paramByteBuffer.get() & 0xFF) << i;
        i += 8;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.SipHashFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */