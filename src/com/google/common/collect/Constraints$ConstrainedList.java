package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.List;
import java.util.ListIterator;

@GwtCompatible
class Constraints$ConstrainedList<E>
  extends ForwardingList<E>
{
  final Constraint<? super E> constraint;
  final List<E> delegate;
  
  Constraints$ConstrainedList(List<E> paramList, Constraint<? super E> paramConstraint)
  {
    delegate = ((List)Preconditions.checkNotNull(paramList));
    constraint = ((Constraint)Preconditions.checkNotNull(paramConstraint));
  }
  
  public void add(int paramInt, E paramE)
  {
    constraint.checkElement(paramE);
    delegate.add(paramInt, paramE);
  }
  
  public boolean add(E paramE)
  {
    constraint.checkElement(paramE);
    return delegate.add(paramE);
  }
  
  public boolean addAll(int paramInt, Collection<? extends E> paramCollection)
  {
    return delegate.addAll(paramInt, Constraints.access$000(paramCollection, constraint));
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    return delegate.addAll(Constraints.access$000(paramCollection, constraint));
  }
  
  protected List<E> delegate()
  {
    return delegate;
  }
  
  public ListIterator<E> listIterator()
  {
    return Constraints.access$100(delegate.listIterator(), constraint);
  }
  
  public ListIterator<E> listIterator(int paramInt)
  {
    return Constraints.access$100(delegate.listIterator(paramInt), constraint);
  }
  
  public E set(int paramInt, E paramE)
  {
    constraint.checkElement(paramE);
    return (E)delegate.set(paramInt, paramE);
  }
  
  public List<E> subList(int paramInt1, int paramInt2)
  {
    return Constraints.constrainedList(delegate.subList(paramInt1, paramInt2), constraint);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Constraints.ConstrainedList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */