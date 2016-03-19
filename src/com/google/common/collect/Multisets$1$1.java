package com.google.common.collect;

import java.util.Iterator;

class Multisets$1$1
  extends AbstractIterator<Multiset.Entry<E>>
{
  Multisets$1$1(Multisets.1 param1, Iterator paramIterator1, Iterator paramIterator2) {}
  
  protected Multiset.Entry<E> computeNext()
  {
    Multiset.Entry localEntry;
    Object localObject;
    if (val$iterator1.hasNext())
    {
      localEntry = (Multiset.Entry)val$iterator1.next();
      localObject = localEntry.getElement();
      return Multisets.immutableEntry(localObject, Math.max(localEntry.getCount(), this$0.val$multiset2.count(localObject)));
    }
    while (val$iterator2.hasNext())
    {
      localEntry = (Multiset.Entry)val$iterator2.next();
      localObject = localEntry.getElement();
      if (!this$0.val$multiset1.contains(localObject)) {
        return Multisets.immutableEntry(localObject, localEntry.getCount());
      }
    }
    return (Multiset.Entry)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */