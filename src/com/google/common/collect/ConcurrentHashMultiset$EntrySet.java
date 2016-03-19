package com.google.common.collect;

import java.util.ArrayList;
import java.util.List;

class ConcurrentHashMultiset$EntrySet
  extends AbstractMultiset<E>.EntrySet
{
  private ConcurrentHashMultiset$EntrySet(ConcurrentHashMultiset paramConcurrentHashMultiset)
  {
    super(paramConcurrentHashMultiset);
  }
  
  private List<Multiset.Entry<E>> snapshot()
  {
    ArrayList localArrayList = Lists.newArrayListWithExpectedSize(size());
    Iterators.addAll(localArrayList, iterator());
    return localArrayList;
  }
  
  ConcurrentHashMultiset<E> multiset()
  {
    return this$0;
  }
  
  public Object[] toArray()
  {
    return snapshot().toArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return snapshot().toArray(paramArrayOfT);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ConcurrentHashMultiset.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */