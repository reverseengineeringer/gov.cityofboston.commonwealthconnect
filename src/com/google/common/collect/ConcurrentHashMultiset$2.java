package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.atomic.AtomicInteger;

class ConcurrentHashMultiset$2
  extends AbstractIterator<Multiset.Entry<E>>
{
  private Iterator<Map.Entry<E, AtomicInteger>> mapEntries = ConcurrentHashMultiset.access$100(this$0).entrySet().iterator();
  
  ConcurrentHashMultiset$2(ConcurrentHashMultiset paramConcurrentHashMultiset) {}
  
  protected Multiset.Entry<E> computeNext()
  {
    Map.Entry localEntry;
    int i;
    do
    {
      if (!mapEntries.hasNext()) {
        return (Multiset.Entry)endOfData();
      }
      localEntry = (Map.Entry)mapEntries.next();
      i = ((AtomicInteger)localEntry.getValue()).get();
    } while (i == 0);
    return Multisets.immutableEntry(localEntry.getKey(), i);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ConcurrentHashMultiset.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */