package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Set;

class Constraints$ConstrainedSet<E>
  extends ForwardingSet<E>
{
  private final Constraint<? super E> constraint;
  private final Set<E> delegate;
  
  public Constraints$ConstrainedSet(Set<E> paramSet, Constraint<? super E> paramConstraint)
  {
    delegate = ((Set)Preconditions.checkNotNull(paramSet));
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
  
  protected Set<E> delegate()
  {
    return delegate;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraints.ConstrainedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */