package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Collections;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.SortedSet;

@GwtIncompatible("NavigableSet")
final class Sets$UnmodifiableNavigableSet<E>
  extends ForwardingSortedSet<E>
  implements NavigableSet<E>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final NavigableSet<E> delegate;
  private transient UnmodifiableNavigableSet<E> descendingSet;
  
  Sets$UnmodifiableNavigableSet(NavigableSet<E> paramNavigableSet)
  {
    delegate = ((NavigableSet)Preconditions.checkNotNull(paramNavigableSet));
  }
  
  public E ceiling(E paramE)
  {
    return (E)delegate.ceiling(paramE);
  }
  
  protected SortedSet<E> delegate()
  {
    return Collections.unmodifiableSortedSet(delegate);
  }
  
  public Iterator<E> descendingIterator()
  {
    return Iterators.unmodifiableIterator(delegate.descendingIterator());
  }
  
  public NavigableSet<E> descendingSet()
  {
    UnmodifiableNavigableSet localUnmodifiableNavigableSet2 = descendingSet;
    UnmodifiableNavigableSet localUnmodifiableNavigableSet1 = localUnmodifiableNavigableSet2;
    if (localUnmodifiableNavigableSet2 == null)
    {
      localUnmodifiableNavigableSet1 = new UnmodifiableNavigableSet(delegate.descendingSet());
      descendingSet = localUnmodifiableNavigableSet1;
      descendingSet = this;
    }
    return localUnmodifiableNavigableSet1;
  }
  
  public E floor(E paramE)
  {
    return (E)delegate.floor(paramE);
  }
  
  public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
  {
    return Sets.unmodifiableNavigableSet(delegate.headSet(paramE, paramBoolean));
  }
  
  public E higher(E paramE)
  {
    return (E)delegate.higher(paramE);
  }
  
  public E lower(E paramE)
  {
    return (E)delegate.lower(paramE);
  }
  
  public E pollFirst()
  {
    throw new UnsupportedOperationException();
  }
  
  public E pollLast()
  {
    throw new UnsupportedOperationException();
  }
  
  public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return Sets.unmodifiableNavigableSet(delegate.subSet(paramE1, paramBoolean1, paramE2, paramBoolean2));
  }
  
  public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    return Sets.unmodifiableNavigableSet(delegate.tailSet(paramE, paramBoolean));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.UnmodifiableNavigableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */