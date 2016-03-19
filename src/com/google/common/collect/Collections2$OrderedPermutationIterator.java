package com.google.common.collect;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

final class Collections2$OrderedPermutationIterator<E>
  extends AbstractIterator<List<E>>
{
  final Comparator<? super E> comparator;
  List<E> nextPermutation;
  
  Collections2$OrderedPermutationIterator(List<E> paramList, Comparator<? super E> paramComparator)
  {
    nextPermutation = Lists.newArrayList(paramList);
    comparator = paramComparator;
  }
  
  void calculateNextPermutation()
  {
    int i = findNextJ();
    if (i == -1)
    {
      nextPermutation = null;
      return;
    }
    int j = findNextL(i);
    Collections.swap(nextPermutation, i, j);
    j = nextPermutation.size();
    Collections.reverse(nextPermutation.subList(i + 1, j));
  }
  
  protected List<E> computeNext()
  {
    if (nextPermutation == null) {
      return (List)endOfData();
    }
    ImmutableList localImmutableList = ImmutableList.copyOf(nextPermutation);
    calculateNextPermutation();
    return localImmutableList;
  }
  
  int findNextJ()
  {
    int i = nextPermutation.size() - 2;
    while (i >= 0)
    {
      if (comparator.compare(nextPermutation.get(i), nextPermutation.get(i + 1)) < 0) {
        return i;
      }
      i -= 1;
    }
    return -1;
  }
  
  int findNextL(int paramInt)
  {
    Object localObject = nextPermutation.get(paramInt);
    int i = nextPermutation.size() - 1;
    while (i > paramInt)
    {
      if (comparator.compare(localObject, nextPermutation.get(i)) < 0) {
        return i;
      }
      i -= 1;
    }
    throw new AssertionError("this statement should be unreachable");
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Collections2.OrderedPermutationIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */