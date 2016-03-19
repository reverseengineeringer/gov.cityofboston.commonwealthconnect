package com.google.common.collect;

import java.util.Iterator;

final class Iterables$3
  extends TransformedIterator<Iterable<? extends T>, Iterator<? extends T>>
{
  Iterables$3(Iterator paramIterator)
  {
    super(paramIterator);
  }
  
  Iterator<? extends T> transform(Iterable<? extends T> paramIterable)
  {
    return paramIterable.iterator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterables.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */