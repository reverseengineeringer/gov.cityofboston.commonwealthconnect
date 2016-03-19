package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class AbstractMapBasedMultiset$1
  implements Iterator<Multiset.Entry<E>>
{
  Map.Entry<E, Count> toRemove;
  
  AbstractMapBasedMultiset$1(AbstractMapBasedMultiset paramAbstractMapBasedMultiset, Iterator paramIterator) {}
  
  public boolean hasNext()
  {
    return val$backingEntries.hasNext();
  }
  
  public Multiset.Entry<E> next()
  {
    final Map.Entry localEntry = (Map.Entry)val$backingEntries.next();
    toRemove = localEntry;
    new Multisets.AbstractEntry()
    {
      public int getCount()
      {
        Count localCount1 = (Count)localEntry.getValue();
        if ((localCount1 == null) || (localCount1.get() == 0))
        {
          Count localCount2 = (Count)AbstractMapBasedMultiset.access$000(this$0).get(getElement());
          if (localCount2 != null) {
            return localCount2.get();
          }
        }
        if (localCount1 == null) {
          return 0;
        }
        return localCount1.get();
      }
      
      public E getElement()
      {
        return (E)localEntry.getKey();
      }
    };
  }
  
  public void remove()
  {
    if (toRemove != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      AbstractMapBasedMultiset.access$122(this$0, ((Count)toRemove.getValue()).getAndSet(0));
      val$backingEntries.remove();
      toRemove = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultiset.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */