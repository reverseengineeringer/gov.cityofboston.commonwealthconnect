package com.google.common.collect;

import com.google.common.math.LongMath;
import java.util.AbstractCollection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

final class Collections2$OrderedPermutationCollection<E>
  extends AbstractCollection<List<E>>
{
  final Comparator<? super E> comparator;
  final ImmutableList<E> inputList;
  final int size;
  
  Collections2$OrderedPermutationCollection(Iterable<E> paramIterable, Comparator<? super E> paramComparator)
  {
    inputList = Ordering.from(paramComparator).immutableSortedCopy(paramIterable);
    comparator = paramComparator;
    size = calculateSize(inputList, paramComparator);
  }
  
  private static <E> int calculateSize(List<E> paramList, Comparator<? super E> paramComparator)
  {
    long l2 = 1L;
    int j = 1;
    int i = 1;
    long l1;
    int k;
    if (j < paramList.size())
    {
      l1 = l2;
      k = i;
      if (paramComparator.compare(paramList.get(j - 1), paramList.get(j)) < 0)
      {
        l2 *= LongMath.binomial(j, i);
        k = 0;
        l1 = l2;
        if (Collections2.access$000(l2)) {}
      }
    }
    do
    {
      return Integer.MAX_VALUE;
      j += 1;
      i = k + 1;
      l2 = l1;
      break;
      l1 = l2 * LongMath.binomial(j, i);
    } while (!Collections2.access$000(l1));
    return (int)l1;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if ((paramObject instanceof List))
    {
      paramObject = (List)paramObject;
      return Collections2.access$100(inputList, (List)paramObject);
    }
    return false;
  }
  
  public boolean isEmpty()
  {
    return false;
  }
  
  public Iterator<List<E>> iterator()
  {
    return new Collections2.OrderedPermutationIterator(inputList, comparator);
  }
  
  public int size()
  {
    return size;
  }
  
  public String toString()
  {
    return "orderedPermutationCollection(" + inputList + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Collections2.OrderedPermutationCollection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */