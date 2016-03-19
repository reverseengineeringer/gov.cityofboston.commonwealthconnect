package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import javax.annotation.Nullable;

final class MultiInputStream
  extends InputStream
{
  private InputStream in;
  private Iterator<? extends ByteSource> it;
  
  public MultiInputStream(Iterator<? extends ByteSource> paramIterator)
    throws IOException
  {
    it = ((Iterator)Preconditions.checkNotNull(paramIterator));
    advance();
  }
  
  private void advance()
    throws IOException
  {
    close();
    if (it.hasNext()) {
      in = ((ByteSource)it.next()).openStream();
    }
  }
  
  public int available()
    throws IOException
  {
    if (in == null) {
      return 0;
    }
    return in.available();
  }
  
  public void close()
    throws IOException
  {
    if (in != null) {}
    try
    {
      in.close();
      return;
    }
    finally
    {
      in = null;
    }
  }
  
  public boolean markSupported()
  {
    return false;
  }
  
  public int read()
    throws IOException
  {
    int i;
    if (in == null) {
      i = -1;
    }
    int j;
    do
    {
      return i;
      j = in.read();
      i = j;
    } while (j != -1);
    advance();
    return read();
  }
  
  public int read(@Nullable byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i;
    if (in == null) {
      i = -1;
    }
    int j;
    do
    {
      return i;
      j = in.read(paramArrayOfByte, paramInt1, paramInt2);
      i = j;
    } while (j != -1);
    advance();
    return read(paramArrayOfByte, paramInt1, paramInt2);
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    long l1;
    if ((in == null) || (paramLong <= 0L)) {
      l1 = 0L;
    }
    long l2;
    do
    {
      return l1;
      l2 = in.skip(paramLong);
      l1 = l2;
    } while (l2 != 0L);
    if (read() == -1) {
      return 0L;
    }
    return 1L + in.skip(paramLong - 1L);
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.MultiInputStream
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */