package com.google.common.hash;

import java.io.ByteArrayOutputStream;

final class AbstractNonStreamingHashFunction$ExposedByteArrayOutputStream
  extends ByteArrayOutputStream
{
  AbstractNonStreamingHashFunction$ExposedByteArrayOutputStream(int paramInt)
  {
    super(paramInt);
  }
  
  byte[] byteArray()
  {
    return buf;
  }
  
  int length()
  {
    return count;
  }
}

/* Location:
 * Qualified Name:     com.google.common.hash.AbstractNonStreamingHashFunction.ExposedByteArrayOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */