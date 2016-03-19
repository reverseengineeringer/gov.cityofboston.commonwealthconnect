package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

final class Multisets$1
  extends AbstractMultiset<E>
{
  Multisets$1(Multiset paramMultiset1, Multiset paramMultiset2) {}
  
  public boolean contains(@Nullable Object paramObject)
  {
    return (val$multiset1.contains(paramObject)) || (val$multiset2.contains(paramObject));
  }
  
  public int count(Object paramObject)
  {
    return Math.max(val$multiset1.count(paramObject), val$multiset2.count(paramObject));
  }
  
  Set<E> createElementSet()
  {
    return Sets.union(val$multiset1.elementSet(), val$multiset2.elementSet());
  }
  
  int distinctElements()
  {
    return elementSet().size();
  }
  
  Iterator<Multiset.Entry<E>> entryIterator()
  {
    new AbstractIterator()
    {
      protected Multiset.Entry<E> computeNext()
      {
        Multiset.Entry localEntry;
        Object localObject;
        if (val$iterator1.hasNext())
        {
          localEntry = (Multiset.Entry)val$iterator1.next();
          localObject = localEntry.getElement();
          return Multisets.immutableEntry(localObject, Math.max(localEntry.getCount(), val$multiset2.count(localObject)));
        }
        while (val$iterator2.hasNext())
        {
          localEntry = (Multiset.Entry)val$iterator2.next();
          localObject = localEntry.getElement();
          if (!val$multiset1.contains(localObject)) {
            return Multisets.immutableEntry(localObject, localEntry.getCount());
          }
        }
        return (Multiset.Entry)endOfData();
      }
    };
  }
  
  public boolean isEmpty()
  {
    return (val$multiset1.isEmpty()) && (val$multiset2.isEmpty());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */