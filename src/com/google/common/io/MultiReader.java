package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;
import javax.annotation.Nullable;

class MultiReader
  extends Reader
{
  private Reader current;
  private final Iterator<? extends CharSource> it;
  
  MultiReader(Iterator<? extends CharSource> paramIterator)
    throws IOException
  {
    it = paramIterator;
    advance();
  }
  
  private void advance()
    throws IOException
  {
    close();
    if (it.hasNext()) {
      current = ((CharSource)it.next()).openStream();
    }
  }
  
  public void close()
    throws IOException
  {
    if (current != null) {}
    try
    {
      current.close();
      return;
    }
    finally
    {
      current = null;
    }
  }
  
  public int read(@Nullable char[] paramArrayOfChar, int paramInt1, int paramInt2)
    throws IOException
  {
    int i;
    if (current == null) {
      i = -1;
    }
    int j;
    do
    {
      return i;
      j = current.read(paramArrayOfChar, paramInt1, paramInt2);
      i = j;
    } while (j != -1);
    advance();
    return read(paramArrayOfChar, paramInt1, paramInt2);
  }
  
  public boolean ready()
    throws IOException
  {
    return (current != null) && (current.ready());
  }
  
  public long skip(long paramLong)
    throws IOException
  {
    boolean bool;
    if (paramLong >= 0L)
    {
      bool = true;
      Preconditions.checkArgument(bool, "n is negative");
      if (paramLong <= 0L) {}
    }
    else
    {
      for (;;)
      {
        if (current == null) {
          break label59;
        }
        long l = current.skip(paramLong);
        if (l > 0L)
        {
          return l;
          bool = false;
          break;
        }
        advance();
      }
    }
    label59:
    return 0L;
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.MultiReader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */