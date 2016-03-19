package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import javax.annotation.Nullable;

class DescendingImmutableSortedSet<E>
  extends ImmutableSortedSet<E>
{
  private final ImmutableSortedSet<E> forward;
  
  DescendingImmutableSortedSet(ImmutableSortedSet<E> paramImmutableSortedSet)
  {
    super(Ordering.from(paramImmutableSortedSet.comparator()).reverse());
    forward = paramImmutableSortedSet;
  }
  
  public E ceiling(E paramE)
  {
    return (E)forward.floor(paramE);
  }
  
  @GwtIncompatible("NavigableSet")
  ImmutableSortedSet<E> createDescendingSet()
  {
    throw new AssertionError("should never be called");
  }
  
  @GwtIncompatible("NavigableSet")
  public UnmodifiableIterator<E> descendingIterator()
  {
    return forward.iterator();
  }
  
  @GwtIncompatible("NavigableSet")
  public ImmutableSortedSet<E> descendingSet()
  {
    return forward;
  }
  
  public E floor(E paramE)
  {
    return (E)forward.ceiling(paramE);
  }
  
  ImmutableSortedSet<E> headSetImpl(E paramE, boolean paramBoolean)
  {
    return forward.tailSet(paramE, paramBoolean).descendingSet();
  }
  
  public E higher(E paramE)
  {
    return (E)forward.lower(paramE);
  }
  
  int indexOf(@Nullable Object paramObject)
  {
    int i = forward.indexOf(paramObject);
    if (i == -1) {
      return i;
    }
    return size() - 1 - i;
  }
  
  boolean isPartialView()
  {
    return forward.isPartialView();
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return forward.descendingIterator();
  }
  
  public E lower(E paramE)
  {
    return (E)forward.higher(paramE);
  }
  
  public int size()
  {
    return forward.size();
  }
  
  ImmutableSortedSet<E> subSetImpl(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return forward.subSet(paramE2, paramBoolean2, paramE1, paramBoolean1).descendingSet();
  }
  
  ImmutableSortedSet<E> tailSetImpl(E paramE, boolean paramBoolean)
  {
    return forward.headSet(paramE, paramBoolean).descendingSet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DescendingImmutableSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */