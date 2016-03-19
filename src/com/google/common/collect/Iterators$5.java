package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.NoSuchElementException;

final class Iterators$5
  implements Iterator<T>
{
  Iterator<? extends T> current = Iterators.emptyIterator();
  Iterator<? extends T> removeFrom;
  
  Iterators$5(Iterator paramIterator) {}
  
  public boolean hasNext()
  {
    boolean bool;
    for (;;)
    {
      bool = ((Iterator)Preconditions.checkNotNull(current)).hasNext();
      if ((bool) || (!val$inputs.hasNext())) {
        break;
      }
      current = ((Iterator)val$inputs.next());
    }
    return bool;
  }
  
  public T next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    removeFrom = current;
    return (T)current.next();
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
 * Qualified Name:     com.google.common.collect.Iterators.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */