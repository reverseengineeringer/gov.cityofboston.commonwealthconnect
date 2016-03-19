package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Comparator;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
final class ComparatorOrdering<T>
  extends Ordering<T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Comparator<T> comparator;
  
  ComparatorOrdering(Comparator<T> paramComparator)
  {
    comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
  }
  
  public int compare(T paramT1, T paramT2)
  {
    return comparator.compare(paramT1, paramT2);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject instanceof ComparatorOrdering))
    {
      paramObject = (ComparatorOrdering)paramObject;
      return comparator.equals(comparator);
    }
    return false;
  }
  
  public int hashCode()
  {
    return comparator.hashCode();
  }
  
  public String toString()
  {
    return comparator.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ComparatorOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */