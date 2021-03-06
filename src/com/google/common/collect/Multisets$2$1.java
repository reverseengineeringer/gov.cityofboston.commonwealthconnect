package com.google.common.collect;

import java.util.Iterator;

class Multisets$2$1
  extends AbstractIterator<Multiset.Entry<E>>
{
  Multisets$2$1(Multisets.2 param2, Iterator paramIterator) {}
  
  protected Multiset.Entry<E> computeNext()
  {
    while (val$iterator1.hasNext())
    {
      Multiset.Entry localEntry = (Multiset.Entry)val$iterator1.next();
      Object localObject = localEntry.getElement();
      int i = Math.min(localEntry.getCount(), this$0.val$multiset2.count(localObject));
      if (i > 0) {
        return Multisets.immutableEntry(localObject, i);
      }
    }
    return (Multiset.Entry)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */