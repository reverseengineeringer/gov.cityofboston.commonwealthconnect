package com.google.common.collect;

import java.util.Iterator;
import java.util.NoSuchElementException;

final class Multisets$MultisetIteratorImpl<E>
  implements Iterator<E>
{
  private boolean canRemove;
  private Multiset.Entry<E> currentEntry;
  private final Iterator<Multiset.Entry<E>> entryIterator;
  private int laterCount;
  private final Multiset<E> multiset;
  private int totalCount;
  
  Multisets$MultisetIteratorImpl(Multiset<E> paramMultiset, Iterator<Multiset.Entry<E>> paramIterator)
  {
    multiset = paramMultiset;
    entryIterator = paramIterator;
  }
  
  public boolean hasNext()
  {
    return (laterCount > 0) || (entryIterator.hasNext());
  }
  
  public E next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    if (laterCount == 0)
    {
      currentEntry = ((Multiset.Entry)entryIterator.next());
      int i = currentEntry.getCount();
      laterCount = i;
      totalCount = i;
    }
    laterCount -= 1;
    canRemove = true;
    return (E)currentEntry.getElement();
  }
  
  public void remove()
  {
    CollectPreconditions.checkRemove(canRemove);
    if (totalCount == 1) {
      entryIterator.remove();
    }
    for (;;)
    {
      totalCount -= 1;
      canRemove = false;
      return;
      multiset.remove(currentEntry.getElement());
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.MultisetIteratorImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */