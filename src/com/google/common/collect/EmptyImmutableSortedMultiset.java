package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Comparator;
import javax.annotation.Nullable;

final class EmptyImmutableSortedMultiset<E>
  extends ImmutableSortedMultiset<E>
{
  private final ImmutableSortedSet<E> elementSet;
  
  EmptyImmutableSortedMultiset(Comparator<? super E> paramComparator)
  {
    elementSet = ImmutableSortedSet.emptySet(paramComparator);
  }
  
  public ImmutableList<E> asList()
  {
    return ImmutableList.of();
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return paramCollection.isEmpty();
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    return paramInt;
  }
  
  public int count(@Nullable Object paramObject)
  {
    return 0;
  }
  
  public ImmutableSortedSet<E> elementSet()
  {
    return elementSet;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Multiset)) {
      return ((Multiset)paramObject).isEmpty();
    }
    return false;
  }
  
  public Multiset.Entry<E> firstEntry()
  {
    return null;
  }
  
  Multiset.Entry<E> getEntry(int paramInt)
  {
    throw new AssertionError("should never be called");
  }
  
  public ImmutableSortedMultiset<E> headMultiset(E paramE, BoundType paramBoundType)
  {
    Preconditions.checkNotNull(paramE);
    Preconditions.checkNotNull(paramBoundType);
    return this;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.emptyIterator();
  }
  
  public Multiset.Entry<E> lastEntry()
  {
    return null;
  }
  
  public int size()
  {
    return 0;
  }
  
  public ImmutableSortedMultiset<E> tailMultiset(E paramE, BoundType paramBoundType)
  {
    Preconditions.checkNotNull(paramE);
    Preconditions.checkNotNull(paramBoundType);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EmptyImmutableSortedMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */