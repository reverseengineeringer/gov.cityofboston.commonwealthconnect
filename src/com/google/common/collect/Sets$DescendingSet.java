package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Comparator;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.SortedSet;

@GwtIncompatible("NavigableSet")
class Sets$DescendingSet<E>
  extends ForwardingNavigableSet<E>
{
  private final NavigableSet<E> forward;
  
  Sets$DescendingSet(NavigableSet<E> paramNavigableSet)
  {
    forward = paramNavigableSet;
  }
  
  private static <T> Ordering<T> reverse(Comparator<T> paramComparator)
  {
    return Ordering.from(paramComparator).reverse();
  }
  
  public E ceiling(E paramE)
  {
    return (E)forward.floor(paramE);
  }
  
  public Comparator<? super E> comparator()
  {
    Comparator localComparator = forward.comparator();
    if (localComparator == null) {
      return Ordering.natural().reverse();
    }
    return reverse(localComparator);
  }
  
  protected NavigableSet<E> delegate()
  {
    return forward;
  }
  
  public Iterator<E> descendingIterator()
  {
    return forward.iterator();
  }
  
  public NavigableSet<E> descendingSet()
  {
    return forward;
  }
  
  public E first()
  {
    return (E)forward.last();
  }
  
  public E floor(E paramE)
  {
    return (E)forward.ceiling(paramE);
  }
  
  public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
  {
    return forward.tailSet(paramE, paramBoolean).descendingSet();
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    return standardHeadSet(paramE);
  }
  
  public E higher(E paramE)
  {
    return (E)forward.lower(paramE);
  }
  
  public Iterator<E> iterator()
  {
    return forward.descendingIterator();
  }
  
  public E last()
  {
    return (E)forward.first();
  }
  
  public E lower(E paramE)
  {
    return (E)forward.higher(paramE);
  }
  
  public E pollFirst()
  {
    return (E)forward.pollLast();
  }
  
  public E pollLast()
  {
    return (E)forward.pollFirst();
  }
  
  public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return forward.subSet(paramE2, paramBoolean2, paramE1, paramBoolean1).descendingSet();
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    return standardSubSet(paramE1, paramE2);
  }
  
  public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    return forward.headSet(paramE, paramBoolean).descendingSet();
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    return standardTailSet(paramE);
  }
  
  public Object[] toArray()
  {
    return standardToArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return standardToArray(paramArrayOfT);
  }
  
  public String toString()
  {
    return standardToString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.DescendingSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */