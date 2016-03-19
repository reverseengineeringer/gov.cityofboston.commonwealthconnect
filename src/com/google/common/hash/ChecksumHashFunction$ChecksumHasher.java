package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.util.zip.Checksum;

final class ChecksumHashFunction$ChecksumHasher
  extends AbstractByteHasher
{
  private final Checksum checksum;
  
  private ChecksumHashFunction$ChecksumHasher(ChecksumHashFunction paramChecksumHashFunction, Checksum paramChecksum)
  {
    checksum = ((Checksum)Preconditions.checkNotNull(paramChecksum));
  }
  
  public HashCode hash()
  {
    long l = checksum.getValue();
    if (ChecksumHashFunction.access$100(this$0) == 32) {
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

/* Location:
 * Qualified Name:     com.google.common.hash.ChecksumHashFunction.ChecksumHasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */