package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.util.Collection;
import java.util.Comparator;
import java.util.NoSuchElementException;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
class EmptyImmutableSortedSet<E>
  extends ImmutableSortedSet<E>
{
  EmptyImmutableSortedSet(Comparator<? super E> paramComparator)
  {
    super(paramComparator);
  }
  
  public ImmutableList<E> asList()
  {
    return ImmutableList.of();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return false;
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return paramCollection.isEmpty();
  }
  
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    return paramInt;
  }
  
  ImmutableSortedSet<E> createDescendingSet()
  {
    return new EmptyImmutableSortedSet(Ordering.from(comparator).reverse());
  }
  
  @GwtIncompatible("NavigableSet")
  public UnmodifiableIterator<E> descendingIterator()
  {
    return Iterators.emptyIterator();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Set)) {
      return ((Set)paramObject).isEmpty();
    }
    return false;
  }
  
  public E first()
  {
    throw new NoSuchElementException();
  }
  
  public int hashCode()
  {
    return 0;
  }
  
  ImmutableSortedSet<E> headSetImpl(E paramE, boolean paramBoolean)
  {
    return this;
  }
  
  int indexOf(@Nullable Object paramObject)
  {
    return -1;
  }
  
  public boolean isEmpty()
  {
    return true;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<E> iterator()
  {
    return Iterators.emptyIterator();
  }
  
  public E last()
  {
    throw new NoSuchElementException();
  }
  
  public int size()
  {
    return 0;
  }
  
  ImmutableSortedSet<E> subSetImpl(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return this;
  }
  
  ImmutableSortedSet<E> tailSetImpl(E paramE, boolean paramBoolean)
  {
    return this;
  }
  
  public String toString()
  {
    return "[]";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EmptyImmutableSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */