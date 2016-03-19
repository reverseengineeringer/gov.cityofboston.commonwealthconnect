package com.google.common.collect;

import java.util.Iterator;

class Iterables$10$1
  implements Iterator<T>
{
  boolean atStart = true;
  
  Iterables$10$1(Iterables.10 param10, Iterator paramIterator) {}
  
  public boolean hasNext()
  {
    return val$iterator.hasNext();
  }
  
  public T next()
  {
    Object localObject = val$iterator.next();
    atStart = false;
    return (T)localObject;
  }
  
  public void remove()
  {
    if (!atStart) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      val$iterator.remove();
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterables.10.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */