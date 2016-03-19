package com.google.common.collect;

import java.util.Iterator;

class ImmutableMultiset$1
  extends UnmodifiableIterator<E>
{
  E element;
  int remaining;
  
  ImmutableMultiset$1(ImmutableMultiset paramImmutableMultiset, Iterator paramIterator) {}
  
  public boolean hasNext()
  {
    return (remaining > 0) || (val$entryIterator.hasNext());
  }
  
  public E next()
  {
    if (remaining <= 0)
    {
      Multiset.Entry localEntry = (Multiset.Entry)val$entryIterator.next();
      element = localEntry.getElement();
      remaining = localEntry.getCount();
    }
    remaining -= 1;
    return (E)element;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultiset.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */