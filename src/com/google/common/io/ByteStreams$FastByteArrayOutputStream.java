package com.google.common.io;

import java.io.ByteArrayOutputStream;

final class ByteStreams$FastByteArrayOutputStream
  extends ByteArrayOutputStream
{
  void writeTo(byte[] paramArrayOfByte, int paramInt)
  {
    System.arraycopy(buf, 0, paramArrayOfByte, paramInt, count);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.FastByteArrayOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */