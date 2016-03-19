package com.google.common.collect;

import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class AbstractMapBasedMultiset$MapBasedMultisetIterator
  implements Iterator<E>
{
  boolean canRemove;
  Map.Entry<E, Count> currentEntry;
  final Iterator<Map.Entry<E, Count>> entryIterator;
  int occurrencesLeft;
  
  AbstractMapBasedMultiset$MapBasedMultisetIterator(AbstractMapBasedMultiset paramAbstractMapBasedMultiset)
  {
    entryIterator = AbstractMapBasedMultiset.access$000(paramAbstractMapBasedMultiset).entrySet().iterator();
  }
  
  public boolean hasNext()
  {
    return (occurrencesLeft > 0) || (entryIterator.hasNext());
  }
  
  public E next()
  {
    if (occurrencesLeft == 0)
    {
      currentEntry = ((Map.Entry)entryIterator.next());
      occurrencesLeft = ((Count)currentEntry.getValue()).get();
    }
    occurrencesLeft -= 1;
    canRemove = true;
    return (E)currentEntry.getKey();
  }
  
  public void remove()
  {
    CollectPreconditions.checkRemove(canRemove);
    if (((Count)currentEntry.getValue()).get() <= 0) {
      throw new ConcurrentModificationException();
    }
    if (((Count)currentEntry.getValue()).addAndGet(-1) == 0) {
      entryIterator.remove();
    }
    AbstractMapBasedMultiset.access$110(this$0);
    canRemove = false;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultiset.MapBasedMultisetIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */