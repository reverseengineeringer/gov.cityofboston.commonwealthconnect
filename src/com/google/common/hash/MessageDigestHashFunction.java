package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

final class MessageDigestHashFunction
  extends AbstractStreamingHashFunction
  implements Serializable
{
  private final int bytes;
  private final MessageDigest prototype;
  private final boolean supportsClone;
  private final String toString;
  
  MessageDigestHashFunction(String paramString1, int paramInt, String paramString2)
  {
    toString = ((String)Preconditions.checkNotNull(paramString2));
    prototype = getMessageDigest(paramString1);
    int i = prototype.getDigestLength();
    if ((paramInt >= 4) && (paramInt <= i)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "bytes (%s) must be >= 4 and < %s", new Object[] { Integer.valueOf(paramInt), Integer.valueOf(i) });
      bytes = paramInt;
      supportsClone = supportsClone();
      return;
    }
  }
  
  MessageDigestHashFunction(String paramString1, String paramString2)
  {
    prototype = getMessageDigest(paramString1);
    bytes = prototype.getDigestLength();
    toString = ((String)Preconditions.checkNotNull(paramString2));
    supportsClone = supportsClone();
  }
  
  private static MessageDigest getMessageDigest(String paramString)
  {
    try
    {
      paramString = MessageDigest.getInstance(paramString);
      return paramString;
    }
    catch (NoSuchAlgorithmException paramString)
    {
      throw new AssertionError(paramString);
    }
  }
  
  private boolean supportsClone()
  {
    try
    {
      prototype.clone();
      return true;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return false;
  }
  
  public int bits()
  {
    return bytes * 8;
  }
  
  public Hasher newHasher()
  {
    if (supportsClone) {
      try
      {
        MessageDigestHasher localMessageDigestHasher = new MessageDigestHasher((MessageDigest)prototype.clone(), bytes, null);
        return localMessageDigestHasher;
      }
      catch (CloneNotSupportedException localCloneNotSupportedException) {}
    }
    return new MessageDigestHasher(getMessageDigest(prototype.getAlgorithm()), bytes, null);
  }
  
  public String toString()
  {
    return toString;
  }
  
  Object writeReplace()
  {
    return new SerializedForm(prototype.getAlgorithm(), bytes, toString, null);
  }
  
  private static final class MessageDigestHasher
    extends AbstractByteHasher
  {
    private final int bytes;
    private final MessageDigest digest;
    private boolean done;
    
    private MessageDigestHasher(MessageDigest paramMessageDigest, int paramInt)
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
  
  private static final class SerializedForm
    implements Serializable
  {
    private static final long serialVersionUID = 0L;
    private final String algorithmName;
    private final int bytes;
    private final String toString;
    
    private SerializedForm(String paramString1, int paramInt, String paramString2)
    {
      algorithmName = paramString1;
      bytes = paramInt;
      toString = paramString2;
    }
    
    private Object readResolve()
    {
      return new MessageDigestHashFunction(algorithmName, bytes, toString);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.MessageDigestHashFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */