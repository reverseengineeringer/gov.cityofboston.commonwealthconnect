package com.google.common.collect;

import java.util.Collection;
import java.util.SortedSet;

final class Maps$4
  extends ForwardingSortedSet<E>
{
  Maps$4(SortedSet paramSortedSet) {}
  
  public boolean add(E paramE)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    throw new UnsupportedOperationException();
  }
  
  protected SortedSet<E> delegate()
  {
    return val$set;
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    return Maps.access$300(super.headSet(paramE));
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    return Maps.access$300(super.subSet(paramE1, paramE2));
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    return Maps.access$300(super.tailSet(paramE));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */