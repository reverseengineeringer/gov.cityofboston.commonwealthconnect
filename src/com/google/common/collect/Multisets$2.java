package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;

final class Multisets$2
  extends AbstractMultiset<E>
{
  Multisets$2(Multiset paramMultiset1, Multiset paramMultiset2) {}
  
  public int count(Object paramObject)
  {
    int i = val$multiset1.count(paramObject);
    if (i == 0) {
      return 0;
    }
    return Math.min(i, val$multiset2.count(paramObject));
  }
  
  Set<E> createElementSet()
  {
    return Sets.intersection(val$multiset1.elementSet(), val$multiset2.elementSet());
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
        while (val$iterator1.hasNext())
        {
          Multiset.Entry localEntry = (Multiset.Entry)val$iterator1.next();
          Object localObject = localEntry.getElement();
          int i = Math.min(localEntry.getCount(), val$multiset2.count(localObject));
          if (i > 0) {
            return Multisets.immutableEntry(localObject, i);
          }
        }
        return (Multiset.Entry)endOfData();
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */