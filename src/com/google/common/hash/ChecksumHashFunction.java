package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.zip.Checksum;

final class ChecksumHashFunction
  extends AbstractStreamingHashFunction
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final int bits;
  private final Supplier<? extends Checksum> checksumSupplier;
  private final String toString;
  
  ChecksumHashFunction(Supplier<? extends Checksum> paramSupplier, int paramInt, String paramString)
  {
    checksumSupplier = ((Supplier)Preconditions.checkNotNull(paramSupplier));
    if ((paramInt == 32) || (paramInt == 64)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "bits (%s) must be either 32 or 64", new Object[] { Integer.valueOf(paramInt) });
      bits = paramInt;
      toString = ((String)Preconditions.checkNotNull(paramString));
      return;
    }
  }
  
  public int bits()
  {
    return bits;
  }
  
  public Hasher newHasher()
  {
    return new ChecksumHasher((Checksum)checksumSupplier.get(), null);
  }
  
  public String toString()
  {
    return toString;
  }
  
  private final class ChecksumHasher
    extends AbstractByteHasher
  {
    private final Checksum checksum;
    
    private ChecksumHasher(Checksum paramChecksum)
    {
      checksum = ((Checksum)Preconditions.checkNotNull(paramChecksum));
    }
    
    public HashCode hash()
    {
      long l = checksum.getValue();
      if (bits == 32) {
        return HashCode.fromInt((int)l);
      }
      return HashCode.fromLong(l);
    }
    
    protected void update(byte paramByte)
    {
      checksum.update(paramByte);
    }
    
    protected void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      checksum.update(paramArrayOfByte, paramInt1, paramInt2);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.ChecksumHashFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */