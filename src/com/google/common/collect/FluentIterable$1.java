package com.google.common.collect;

import java.util.Iterator;

final class FluentIterable$1
  extends FluentIterable<E>
{
  FluentIterable$1(Iterable paramIterable1, Iterable paramIterable2)
  {
    super(paramIterable1);
  }
  
  public Iterator<E> iterator()
  {
    return val$iterable.iterator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FluentIterable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */