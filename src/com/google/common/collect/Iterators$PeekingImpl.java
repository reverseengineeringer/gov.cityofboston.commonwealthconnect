package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;

class Iterators$PeekingImpl<E>
  implements PeekingIterator<E>
{
  private boolean hasPeeked;
  private final Iterator<? extends E> iterator;
  private E peekedElement;
  
  public Iterators$PeekingImpl(Iterator<? extends E> paramIterator)
  {
    iterator = ((Iterator)Preconditions.checkNotNull(paramIterator));
  }
  
  public boolean hasNext()
  {
    return (hasPeeked) || (iterator.hasNext());
  }
  
  public E next()
  {
    if (!hasPeeked) {
      return (E)iterator.next();
    }
    Object localObject = peekedElement;
    hasPeeked = false;
    peekedElement = null;
    return (E)localObject;
  }
  
  public E peek()
  {
    if (!hasPeeked)
    {
      peekedElement = iterator.next();
      hasPeeked = true;
    }
    return (E)peekedElement;
  }
  
  public void remove()
  {
    if (!hasPeeked) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "Can't remove after you've peeked at next");
      iterator.remove();
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators.PeekingImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */