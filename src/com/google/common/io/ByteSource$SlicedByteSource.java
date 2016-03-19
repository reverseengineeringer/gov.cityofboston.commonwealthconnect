package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStream;

final class ByteSource$SlicedByteSource
  extends ByteSource
{
  private final long length;
  private final long offset;
  
  private ByteSource$SlicedByteSource(ByteSource paramByteSource, long paramLong1, long paramLong2)
  {
    if (paramLong1 >= 0L)
    {
      bool = true;
      Preconditions.checkArgument(bool, "offset (%s) may not be negative", new Object[] { Long.valueOf(paramLong1) });
      if (paramLong2 < 0L) {
        break label83;
      }
    }
    label83:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "length (%s) may not be negative", new Object[] { Long.valueOf(paramLong2) });
      offset = paramLong1;
      length = paramLong2;
      return;
      bool = false;
      break;
    }
  }
  
  private InputStream sliceStream(InputStream paramInputStream)
    throws IOException
  {
    if (offset > 0L) {}
    try
    {
      ByteStreams.skipFully(paramInputStream, offset);
      return ByteStreams.limit(paramInputStream, length);
    }
    catch (Throwable localThrowable)
    {
      Closer localCloser = Closer.create();
      localCloser.register(paramInputStream);
      try
      {
        throw localCloser.rethrow(localThrowable);
      }
      finally
      {
        localCloser.close();
      }
    }
  }
  
  public boolean isEmpty()
    throws IOException
  {
    return (length == 0L) || (super.isEmpty());
  }
  
  public InputStream openBufferedStream()
    throws IOException
  {
    return sliceStream(this$0.openBufferedStream());
  }
  
  public InputStream openStream()
    throws IOException
  {
    return sliceStream(this$0.openStream());
  }
  
  public ByteSource slice(long paramLong1, long paramLong2)
  {
    if (paramLong1 >= 0L)
    {
      bool = true;
      Preconditions.checkArgument(bool, "offset (%s) may not be negative", new Object[] { Long.valueOf(paramLong1) });
      if (paramLong2 < 0L) {
        break label88;
      }
    }
    label88:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "length (%s) may not be negative", new Object[] { Long.valueOf(paramLong2) });
      long l = length;
      return this$0.slice(offset + paramLong1, Math.min(paramLong2, l - paramLong1));
      bool = false;
      break;
    }
  }
  
  public String toString()
  {
    return this$0.toString() + ".slice(" + offset + ", " + length + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSource.SlicedByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */