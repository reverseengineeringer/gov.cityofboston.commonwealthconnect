package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Iterator;
import java.util.NavigableSet;

@GwtIncompatible("Navigable")
class SortedMultisets$NavigableElementSet<E>
  extends SortedMultisets.ElementSet<E>
  implements NavigableSet<E>
{
  SortedMultisets$NavigableElementSet(SortedMultiset<E> paramSortedMultiset)
  {
    super(paramSortedMultiset);
  }
  
  public E ceiling(E paramE)
  {
    return (E)SortedMultisets.access$100(multiset().tailMultiset(paramE, BoundType.CLOSED).firstEntry());
  }
  
  public Iterator<E> descendingIterator()
  {
    return descendingSet().iterator();
  }
  
  public NavigableSet<E> descendingSet()
  {
    return new NavigableElementSet(multiset().descendingMultiset());
  }
  
  public E floor(E paramE)
  {
    return (E)SortedMultisets.access$100(multiset().headMultiset(paramE, BoundType.CLOSED).lastEntry());
  }
  
  public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
  {
    return new NavigableElementSet(multiset().headMultiset(paramE, BoundType.forBoolean(paramBoolean)));
  }
  
  public E higher(E paramE)
  {
    return (E)SortedMultisets.access$100(multiset().tailMultiset(paramE, BoundType.OPEN).firstEntry());
  }
  
  public E lower(E paramE)
  {
    return (E)SortedMultisets.access$100(multiset().headMultiset(paramE, BoundType.OPEN).lastEntry());
  }
  
  public E pollFirst()
  {
    return (E)SortedMultisets.access$100(multiset().pollFirstEntry());
  }
  
  public E pollLast()
  {
    return (E)SortedMultisets.access$100(multiset().pollLastEntry());
  }
  
  public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    return new NavigableElementSet(multiset().subMultiset(paramE1, BoundType.forBoolean(paramBoolean1), paramE2, BoundType.forBoolean(paramBoolean2)));
  }
  
  public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    return new NavigableElementSet(multiset().tailMultiset(paramE, BoundType.forBoolean(paramBoolean)));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SortedMultisets.NavigableElementSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */