package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;

final class CharSource$ConcatenatedCharSource
  extends CharSource
{
  private final Iterable<? extends CharSource> sources;
  
  CharSource$ConcatenatedCharSource(Iterable<? extends CharSource> paramIterable)
  {
    sources = ((Iterable)Preconditions.checkNotNull(paramIterable));
  }
  
  public boolean isEmpty()
    throws IOException
  {
    Iterator localIterator = sources.iterator();
    while (localIterator.hasNext()) {
      if (!((CharSource)localIterator.next()).isEmpty()) {
        return false;
      }
    }
    return true;
  }
  
  public Reader openStream()
    throws IOException
  {
    return new MultiReader(sources.iterator());
  }
  
  public String toString()
  {
    return "CharSource.concat(" + sources + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.io.CharSource.ConcatenatedCharSource
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */