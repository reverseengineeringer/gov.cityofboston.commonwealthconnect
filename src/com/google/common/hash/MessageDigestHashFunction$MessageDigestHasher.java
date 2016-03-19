package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.security.MessageDigest;
import java.util.Arrays;

final class MessageDigestHashFunction$MessageDigestHasher
  extends AbstractByteHasher
{
  private final int bytes;
  private final MessageDigest digest;
  private boolean done;
  
  private MessageDigestHashFunction$MessageDigestHasher(MessageDigest paramMessageDigest, int paramInt)
  {
    digest = paramMessageDigest;
    bytes = paramInt;
  }
  
  private void checkNotDone()
  {
    if (!done) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Cannot re-use a Hasher after calling hash() on it");
      return;
    }
  }
  
  public HashCode hash()
  {
    checkNotDone();
    done = true;
    if (bytes == digest.getDigestLength()) {
      return HashCode.fromBytesNoCopy(digest.digest());
    }
    return HashCode.fromBytesNoCopy(Arrays.copyOf(digest.digest(), bytes));
  }
  
  protected void update(byte paramByte)
  {
    checkNotDone();
    digest.update(paramByte);
  }
  
  protected void update(byte[] paramArrayOfByte)
  {
    checkNotDone();
    digest.update(paramArrayOfByte);
  }
  
  protected void update(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    checkNotDone();
    digest.update(paramArrayOfByte, paramInt1, paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.MessageDigestHashFunction.MessageDigestHasher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */