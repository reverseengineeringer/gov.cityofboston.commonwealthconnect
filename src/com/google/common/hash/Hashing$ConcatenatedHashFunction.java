package com.google.common.hash;

import com.google.common.annotations.VisibleForTesting;
import javax.annotation.Nullable;

@VisibleForTesting
final class Hashing$ConcatenatedHashFunction
  extends AbstractCompositeHashFunction
{
  private final int bits;
  
  Hashing$ConcatenatedHashFunction(HashFunction... paramVarArgs)
  {
    super(paramVarArgs);
    int j = 0;
    int k = paramVarArgs.length;
    int i = 0;
    while (i < k)
    {
      j += paramVarArgs[i].bits();
      i += 1;
    }
    bits = j;
  }
  
  public int bits()
  {
    return bits;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof ConcatenatedHashFunction))
    {
      paramObject = (ConcatenatedHashFunction)paramObject;
      if ((bits == bits) && (functions.length == functions.length)) {}
    }
    else
    {
      return false;
    }
    int i = 0;
    for (;;)
    {
      if (i >= functions.length) {
        break label74;
      }
      if (!functions[i].equals(functions[i])) {
        break;
      }
      i += 1;
    }
    label74:
    return true;
  }
  
  public int hashCode()
  {
    int j = bits;
    HashFunction[] arrayOfHashFunction = functions;
    int k = arrayOfHashFunction.length;
    int i = 0;
    while (i < k)
    {
      j ^= arrayOfHashFunction[i].hashCode();
      i += 1;
    }
    return j;
  }
  
  HashCode makeHash(Hasher[] paramArrayOfHasher)
  {
    byte[] arrayOfByte = new byte[bits / 8];
    int j = 0;
    int k = paramArrayOfHasher.length;
    int i = 0;
    while (i < k)
    {
      HashCode localHashCode = paramArrayOfHasher[i].hash();
      j += localHashCode.writeBytesTo(arrayOfByte, j, localHashCode.bits() / 8);
      i += 1;
    }
    return HashCode.fromBytesNoCopy(arrayOfByte);
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.Hashing.ConcatenatedHashFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */