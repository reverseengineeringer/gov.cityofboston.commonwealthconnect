package com.google.common.collect;

import java.util.Iterator;
import java.util.NoSuchElementException;

final class Iterators$4
  implements Iterator<T>
{
  Iterator<T> iterator = Iterators.emptyIterator();
  Iterator<T> removeFrom;
  
  Iterators$4(Iterable paramIterable) {}
  
  public boolean hasNext()
  {
    if (!iterator.hasNext()) {
      iterator = val$iterable.iterator();
    }
    return iterator.hasNext();
  }
  
  public T next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    removeFrom = iterator;
    return (T)iterator.next();
  }
  
  public void remove()
  {
    if (removeFrom != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      removeFrom.remove();
      removeFrom = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */