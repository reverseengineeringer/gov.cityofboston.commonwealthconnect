package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Iterator;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
final class ReverseOrdering<T>
  extends Ordering<T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Ordering<? super T> forwardOrder;
  
  ReverseOrdering(Ordering<? super T> paramOrdering)
  {
    forwardOrder = ((Ordering)Preconditions.checkNotNull(paramOrdering));
  }
  
  public int compare(T paramT1, T paramT2)
  {
    return forwardOrder.compare(paramT2, paramT1);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject instanceof ReverseOrdering))
    {
      paramObject = (ReverseOrdering)paramObject;
      return forwardOrder.equals(forwardOrder);
    }
    return false;
  }
  
  public int hashCode()
  {
    return -forwardOrder.hashCode();
  }
  
  public <E extends T> E max(Iterable<E> paramIterable)
  {
    return (E)forwardOrder.min(paramIterable);
  }
  
  public <E extends T> E max(E paramE1, E paramE2)
  {
    return (E)forwardOrder.min(paramE1, paramE2);
  }
  
  public <E extends T> E max(E paramE1, E paramE2, E paramE3, E... paramVarArgs)
  {
    return (E)forwardOrder.min(paramE1, paramE2, paramE3, paramVarArgs);
  }
  
  public <E extends T> E max(Iterator<E> paramIterator)
  {
    return (E)forwardOrder.min(paramIterator);
  }
  
  public <E extends T> E min(Iterable<E> paramIterable)
  {
    return (E)forwardOrder.max(paramIterable);
  }
  
  public <E extends T> E min(E paramE1, E paramE2)
  {
    return (E)forwardOrder.max(paramE1, paramE2);
  }
  
  public <E extends T> E min(E paramE1, E paramE2, E paramE3, E... paramVarArgs)
  {
    return (E)forwardOrder.max(paramE1, paramE2, paramE3, paramVarArgs);
  }
  
  public <E extends T> E min(Iterator<E> paramIterator)
  {
    return (E)forwardOrder.max(paramIterator);
  }
  
  public <S extends T> Ordering<S> reverse()
  {
    return forwardOrder;
  }
  
  public String toString()
  {
    return forwardOrder + ".reverse()";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ReverseOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */