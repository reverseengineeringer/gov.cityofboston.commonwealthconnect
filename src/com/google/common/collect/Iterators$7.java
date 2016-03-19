package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Iterator;

final class Iterators$7
  extends AbstractIterator<T>
{
  Iterators$7(Iterator paramIterator, Predicate paramPredicate) {}
  
  protected T computeNext()
  {
    while (val$unfiltered.hasNext())
    {
      Object localObject = val$unfiltered.next();
      if (val$predicate.apply(localObject)) {
        return (T)localObject;
      }
    }
    return (T)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */