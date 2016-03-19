package com.google.common.io;

import com.google.common.annotations.Beta;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.annotation.Nullable;

@Beta
public final class CountingInputStream
  extends FilterInputStream
{
  private long count;
  private long mark = -1L;
  
  public CountingInputStream(@Nullable InputStream paramInputStream)
  {
    super(paramInputStream);
  }
  
  public long getCount()
  {
    return count;
  }
  
  public void mark(int paramInt)
  {
    try
    {
      in.mark(paramInt);
      mark = count;
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
    int i = in.read();
    if (i != -1) {
      count += 1L;
    }
    return i;
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    paramInt1 = in.read(paramArrayOfByte, paramInt1, paramInt2);
    if (paramInt1 != -1) {
      count += paramInt1;
    }
    return paramInt1;
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
    count = mark;
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    paramLong = in.skip(paramLong);
    count += paramLong;
    return paramLong;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CountingInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */