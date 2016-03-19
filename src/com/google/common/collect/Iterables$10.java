package com.google.common.collect;

import java.util.Iterator;

final class Iterables$10
  extends FluentIterable<T>
{
  Iterables$10(Iterable paramIterable, int paramInt) {}
  
  public Iterator<T> iterator()
  {
    final Iterator localIterator = val$iterable.iterator();
    Iterators.advance(localIterator, val$numberToSkip);
    new Iterator()
    {
      boolean atStart = true;
      
      public boolean hasNext()
      {
        return localIterator.hasNext();
      }
      
      public T next()
      {
        Object localObject = localIterator.next();
        atStart = false;
        return (T)localObject;
      }
      
      public void remove()
      {
        if (!atStart) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          localIterator.remove();
          return;
        }
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterables.10
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */