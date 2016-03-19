package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStream;

final class GwtWorkarounds$3
  extends InputStream
{
  GwtWorkarounds$3(GwtWorkarounds.ByteInput paramByteInput) {}
  
  public void close()
    throws IOException
  {
    val$input.close();
  }
  
  public int read()
    throws IOException
  {
    return val$input.read();
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    Preconditions.checkNotNull(paramArrayOfByte);
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + paramInt2, paramArrayOfByte.length);
    int j;
    if (paramInt2 == 0)
    {
      j = 0;
      return j;
    }
    int i = read();
    if (i == -1) {
      return -1;
    }
    paramArrayOfByte[paramInt1] = ((byte)i);
    i = 1;
    for (;;)
    {
      if (i >= paramInt2) {
        return paramInt2;
      }
      int k = read();
      j = i;
      if (k == -1) {
        break;
      }
      paramArrayOfByte[(paramInt1 + i)] = ((byte)k);
      i += 1;
    }
    return paramInt2;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.GwtWorkarounds.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */