package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

final class ByteStreams$LimitedInputStream
  extends FilterInputStream
{
  private long left;
  private long mark = -1L;
  
  ByteStreams$LimitedInputStream(InputStream paramInputStream, long paramLong)
  {
    super(paramInputStream);
    Preconditions.checkNotNull(paramInputStream);
    if (paramLong >= 0L) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "limit must be non-negative");
      left = paramLong;
      return;
    }
  }
  
  public int available()
    throws IOException
  {
    return (int)Math.min(in.available(), left);
  }
  
  public void mark(int paramInt)
  {
    try
    {
      in.mark(paramInt);
      mark = left;
      return;
    }
    finally
    {
      localObject = finally;
      throw ((Throwable)localObject);
    }
  }
  
  public int read()
    throws IOException
  {
    int i;
    if (left == 0L) {
      i = -1;
    }
    int j;
    do
    {
      return i;
      j = in.read();
      i = j;
    } while (j == -1);
    left -= 1L;
    return j;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (left == 0L) {
      paramInt1 = -1;
    }
    do
    {
      return paramInt1;
      paramInt2 = (int)Math.min(paramInt2, left);
      paramInt2 = in.read(paramArrayOfByte, paramInt1, paramInt2);
      paramInt1 = paramInt2;
    } while (paramInt2 == -1);
    left -= paramInt2;
    return paramInt2;
  }
  
  public void reset()
    throws IOException
  {
    try
    {
      if (!in.markSupported()) {
        throw new IOException("Mark not supported");
      }
    }
    finally {}
    if (mark == -1L) {
      throw new IOException("Mark not set");
    }
    in.reset();
    left = mark;
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    paramLong = Math.min(paramLong, left);
    paramLong = in.skip(paramLong);
    left -= paramLong;
    return paramLong;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteStreams.LimitedInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */