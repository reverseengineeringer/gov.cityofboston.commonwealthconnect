package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import java.util.Comparator;

@GwtCompatible(serializable=true)
final class CompoundOrdering<T>
  extends Ordering<T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final ImmutableList<Comparator<? super T>> comparators;
  
  CompoundOrdering(Iterable<? extends Comparator<? super T>> paramIterable)
  {
    comparators = ImmutableList.copyOf(paramIterable);
  }
  
  CompoundOrdering(Comparator<? super T> paramComparator1, Comparator<? super T> paramComparator2)
  {
    comparators = ImmutableList.of(paramComparator1, paramComparator2);
  }
  
  public int compare(T paramT1, T paramT2)
  {
    int j = comparators.size();
    int i = 0;
    while (i < j)
    {
      int k = ((Comparator)comparators.get(i)).compare(paramT1, paramT2);
      if (k != 0) {
        return k;
      }
      i += 1;
    }
    return 0;
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    if ((paramObject instanceof CompoundOrdering))
    {
      paramObject = (CompoundOrdering)paramObject;
      return comparators.equals(comparators);
    }
    return false;
  }
  
  public int hashCode()
  {
    return comparators.hashCode();
  }
  
  public String toString()
  {
    return "Ordering.compound(" + comparators + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.CompoundOrdering
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */