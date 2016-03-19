package com.google.common.collect;

import java.util.Iterator;
import java.util.Set;
import javax.annotation.Nullable;

final class Multisets$4
  extends AbstractMultiset<E>
{
  Multisets$4(Multiset paramMultiset1, Multiset paramMultiset2) {}
  
  public int count(@Nullable Object paramObject)
  {
    int i = val$multiset1.count(paramObject);
    if (i == 0) {
      return 0;
    }
    return Math.max(0, i - val$multiset2.count(paramObject));
  }
  
  int distinctElements()
  {
    return Iterators.size(entryIterator());
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
          int i = localEntry.getCount() - val$multiset2.count(localObject);
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
 * Qualified Name:     com.google.common.collect.Multisets.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */