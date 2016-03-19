package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;

final class Iterables$15
  implements Function<Iterable<? extends T>, Iterator<? extends T>>
{
  public Iterator<? extends T> apply(Iterable<? extends T> paramIterable)
  {
    return paramIterable.iterator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterables.15
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */