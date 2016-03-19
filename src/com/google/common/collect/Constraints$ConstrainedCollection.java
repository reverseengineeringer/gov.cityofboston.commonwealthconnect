package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;

class Constraints$ConstrainedCollection<E>
  extends ForwardingCollection<E>
{
  private final Constraint<? super E> constraint;
  private final Collection<E> delegate;
  
  public Constraints$ConstrainedCollection(Collection<E> paramCollection, Constraint<? super E> paramConstraint)
  {
    delegate = ((Collection)Preconditions.checkNotNull(paramCollection));
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
  
  protected Collection<E> delegate()
  {
    return delegate;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraints.ConstrainedCollection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */