package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Comparator;
import java.util.Iterator;
import java.util.SortedSet;

class Sets$FilteredSortedSet<E>
  extends Sets.FilteredSet<E>
  implements SortedSet<E>
{
  Sets$FilteredSortedSet(SortedSet<E> paramSortedSet, Predicate<? super E> paramPredicate)
  {
    super(paramSortedSet, paramPredicate);
  }
  
  public Comparator<? super E> comparator()
  {
    return ((SortedSet)unfiltered).comparator();
  }
  
  public E first()
  {
    return (E)iterator().next();
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    return new FilteredSortedSet(((SortedSet)unfiltered).headSet(paramE), predicate);
  }
  
  public E last()
  {
    Object localObject;
    for (SortedSet localSortedSet = (SortedSet)unfiltered;; localSortedSet = localSortedSet.headSet(localObject))
    {
      localObject = localSortedSet.last();
      if (predicate.apply(localObject)) {
        return (E)localObject;
      }
    }
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    return new FilteredSortedSet(((SortedSet)unfiltered).subSet(paramE1, paramE2), predicate);
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    return new FilteredSortedSet(((SortedSet)unfiltered).tailSet(paramE), predicate);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Sets.FilteredSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */