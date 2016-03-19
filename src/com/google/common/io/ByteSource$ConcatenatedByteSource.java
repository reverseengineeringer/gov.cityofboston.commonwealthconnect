package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

final class ByteSource$ConcatenatedByteSource
  extends ByteSource
{
  private final Iterable<? extends ByteSource> sources;
  
  ByteSource$ConcatenatedByteSource(Iterable<? extends ByteSource> paramIterable)
  {
    sources = ((Iterable)Preconditions.checkNotNull(paramIterable));
  }
  
  public boolean isEmpty()
    throws IOException
  {
    Iterator localIterator = sources.iterator();
    while (localIterator.hasNext()) {
      if (!((ByteSource)localIterator.next()).isEmpty()) {
        return false;
      }
    }
    return true;
  }
  
  public InputStream openStream()
    throws IOException
  {
    return new MultiInputStream(sources.iterator());
  }
  
  public long size()
    throws IOException
  {
    long l = 0L;
    Iterator localIterator = sources.iterator();
    while (localIterator.hasNext()) {
      l += ((ByteSource)localIterator.next()).size();
    }
    return l;
  }
  
  public String toString()
  {
    return "ByteSource.concat(" + sources + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.ByteSource.ConcatenatedByteSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */