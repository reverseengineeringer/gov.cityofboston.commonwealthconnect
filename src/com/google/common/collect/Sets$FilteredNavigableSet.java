package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Predicate;
import java.util.Iterator;
import java.util.NavigableSet;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableSet")
class Sets$FilteredNavigableSet<E>
  extends Sets.FilteredSortedSet<E>
  implements NavigableSet<E>
{
  Sets$FilteredNavigableSet(NavigableSet<E> paramNavigableSet, Predicate<? super E> paramPredicate)
  {
    super(paramNavigableSet, paramPredicate);
  }
  
  public E ceiling(E paramE)
  {
    return (E)Iterables.getFirst(tailSet(paramE, true), null);
  }
  
  public Iterator<E> descendingIterator()
  {
    return Iterators.filter(unfiltered().descendingIterator(), predicate);
  }
  
  public NavigableSet<E> descendingSet()
  {
    return Sets.filter(unfiltered().descendingSet(), predicate);
  }
  
  @Nullable
  public E floor(E paramE)
  {
    return (E)Iterators.getNext(headSet(paramE, true).descendingIterator(), null);
  }
  
  public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
  {
    return Sets.filter(unfiltered().headSet(paramE, paramBoolean), predicate);
  }
  
  public E higher(E paramE)
  {
    return (E)Iterables.getFirst(tailSet(paramE, false), null);
  }
  
  public E last()
  {
    return (E)descendingIterator().next();
  }
  
  @Nullable
  public E lower(E paramE)
  {
    return (E)Iterators.getNext(headSet(paramE, false).descendingIterator(), null);
  }
  
  public E pollFirst()
  {
    return (E)Iterables.removeFirstMatching(unfiltered(), predicate);
  }
  
  public E pollLast()
  {
    return (E)Iterables.removeFirstMatching(unfiltered().descendingSet(), predicate);
  }
  
  public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return Sets.filter(unfiltered().subSet(paramE1, paramBoolean1, paramE2, paramBoolean2), predicate);
  }
  
  public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    return Sets.filter(unfiltered().tailSet(paramE, paramBoolean), predicate);
  }
  
  NavigableSet<E> unfiltered()
  {
    return (NavigableSet)unfiltered;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.FilteredNavigableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */