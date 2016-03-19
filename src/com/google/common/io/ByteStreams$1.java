package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.OutputStream;

final class ByteStreams$1
  extends OutputStream
{
  public String toString()
  {
    return "ByteStreams.nullOutputStream()";
  }
  
  public void write(int paramInt) {}
  
  public void write(byte[] paramArrayOfByte)
  {
    Preconditions.checkNotNull(paramArrayOfByte);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    Preconditions.checkNotNull(paramArrayOfByte);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */