package com.google.common.io;

import com.google.common.annotations.Beta;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import javax.annotation.Nullable;

@Beta
public final class CountingOutputStream
  extends FilterOutputStream
{
  private long count;
  
  public CountingOutputStream(@Nullable OutputStream paramOutputStream)
  {
    super(paramOutputStream);
  }
  
  public void close()
    throws IOException
  {
    out.close();
  }
  
  public long getCount()
  {
    return count;
  }
  
  public void write(int paramInt)
    throws IOException
  {
    out.write(paramInt);
    count += 1L;
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    out.write(paramArrayOfByte, paramInt1, paramInt2);
    count += paramInt2;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CountingOutputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */