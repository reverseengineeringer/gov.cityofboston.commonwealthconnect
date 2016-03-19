package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;

class SortedMultisets$ElementSet<E>
  extends Multisets.ElementSet<E>
  implements SortedSet<E>
{
  private final SortedMultiset<E> multiset;
  
  SortedMultisets$ElementSet(SortedMultiset<E> paramSortedMultiset)
  {
    multiset = paramSortedMultiset;
  }
  
  public Comparator<? super E> comparator()
  {
    return multiset().comparator();
  }
  
  public E first()
  {
    return (E)SortedMultisets.access$000(multiset().firstEntry());
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    return multiset().headMultiset(paramE, BoundType.OPEN).elementSet();
  }
  
  public E last()
  {
    return (E)SortedMultisets.access$000(multiset().lastEntry());
  }
  
  final SortedMultiset<E> multiset()
  {
    return multiset;
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    return multiset().subMultiset(paramE1, BoundType.CLOSED, paramE2, BoundType.OPEN).elementSet();
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    return multiset().tailMultiset(paramE, BoundType.CLOSED).elementSet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SortedMultisets.ElementSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */