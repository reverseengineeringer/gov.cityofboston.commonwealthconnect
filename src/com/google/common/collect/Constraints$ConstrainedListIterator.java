package com.google.common.collect;

import java.util.ListIterator;

class Constraints$ConstrainedListIterator<E>
  extends ForwardingListIterator<E>
{
  private final Constraint<? super E> constraint;
  private final ListIterator<E> delegate;
  
  public Constraints$ConstrainedListIterator(ListIterator<E> paramListIterator, Constraint<? super E> paramConstraint)
  {
    delegate = paramListIterator;
    constraint = paramConstraint;
  }
  
  public void add(E paramE)
  {
    constraint.checkElement(paramE);
    delegate.add(paramE);
  }
  
  protected ListIterator<E> delegate()
  {
    return delegate;
  }
  
  public void set(E paramE)
  {
    constraint.checkElement(paramE);
    delegate.set(paramE);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraints.ConstrainedListIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */