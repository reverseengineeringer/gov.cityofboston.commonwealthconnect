package com.google.common.collect;

import javax.annotation.Nullable;

final class DescendingImmutableSortedMultiset<E>
  extends ImmutableSortedMultiset<E>
{
  private final transient ImmutableSortedMultiset<E> forward;
  
  DescendingImmutableSortedMultiset(ImmutableSortedMultiset<E> paramImmutableSortedMultiset)
  {
    forward = paramImmutableSortedMultiset;
  }
  
  public int count(@Nullable Object paramObject)
  {
    return forward.count(paramObject);
  }
  
  public ImmutableSortedMultiset<E> descendingMultiset()
  {
    return forward;
  }
  
  public ImmutableSortedSet<E> elementSet()
  {
    return forward.elementSet().descendingSet();
  }
  
  public Multiset.Entry<E> firstEntry()
  {
    return forward.lastEntry();
  }
  
  Multiset.Entry<E> getEntry(int paramInt)
  {
    return (Multiset.Entry)forward.entrySet().asList().reverse().get(paramInt);
  }
  
  public ImmutableSortedMultiset<E> headMultiset(E paramE, BoundType paramBoundType)
  {
    return forward.tailMultiset(paramE, paramBoundType).descendingMultiset();
  }
  
  boolean isPartialView()
  {
    return forward.isPartialView();
  }
  
  public Multiset.Entry<E> lastEntry()
  {
    return forward.firstEntry();
  }
  
  public int size()
  {
    return forward.size();
  }
  
  public ImmutableSortedMultiset<E> tailMultiset(E paramE, BoundType paramBoundType)
  {
    return forward.headMultiset(paramE, paramBoundType).descendingMultiset();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DescendingImmutableSortedMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */