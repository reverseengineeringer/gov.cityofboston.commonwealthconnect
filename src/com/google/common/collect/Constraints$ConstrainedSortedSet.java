package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.SortedSet;

class Constraints$ConstrainedSortedSet<E>
  extends ForwardingSortedSet<E>
{
  final Constraint<? super E> constraint;
  final SortedSet<E> delegate;
  
  Constraints$ConstrainedSortedSet(SortedSet<E> paramSortedSet, Constraint<? super E> paramConstraint)
  {
    delegate = ((SortedSet)Preconditions.checkNotNull(paramSortedSet));
    constraint = ((Constraint)Preconditions.checkNotNull(paramConstraint));
  }
  
  public boolean add(E paramE)
  {
    constraint.checkElement(paramE);
    return delegate.add(paramE);
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    return delegate.addAll(Constraints.access$000(paramCollection, constraint));
  }
  
  protected SortedSet<E> delegate()
  {
    return delegate;
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    return Constraints.constrainedSortedSet(delegate.headSet(paramE), constraint);
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    return Constraints.constrainedSortedSet(delegate.subSet(paramE1, paramE2), constraint);
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    return Constraints.constrainedSortedSet(delegate.tailSet(paramE), constraint);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraints.ConstrainedSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */