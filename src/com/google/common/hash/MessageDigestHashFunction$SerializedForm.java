package com.google.common.hash;

import java.io.Serializable;

final class MessageDigestHashFunction$SerializedForm
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final String algorithmName;
  private final int bytes;
  private final String toString;
  
  private MessageDigestHashFunction$SerializedForm(String paramString1, int paramInt, String paramString2)
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

/* Location:
 * Qualified Name:     com.google.common.hash.MessageDigestHashFunction.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */