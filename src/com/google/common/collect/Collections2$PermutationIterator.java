package com.google.common.collect;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

class Collections2$PermutationIterator<E>
  extends AbstractIterator<List<E>>
{
  final int[] c;
  int j;
  final List<E> list;
  final int[] o;
  
  Collections2$PermutationIterator(List<E> paramList)
  {
    list = new ArrayList(paramList);
    int i = paramList.size();
    c = new int[i];
    o = new int[i];
    Arrays.fill(c, 0);
    Arrays.fill(o, 1);
    j = Integer.MAX_VALUE;
  }
  
  void calculateNextPermutation()
  {
    j = (list.size() - 1);
    int i = 0;
    if (j == -1) {
      return;
    }
    int k;
    for (;;)
    {
      k = c[j] + o[j];
      if (k < 0)
      {
        switchDirection();
      }
      else
      {
        if (k != j + 1) {
          break label85;
        }
        if (j == 0) {
          break;
        }
        i += 1;
        switchDirection();
      }
    }
    label85:
    Collections.swap(list, j - c[j] + i, j - k + i);
    c[j] = k;
  }
  
  protected List<E> computeNext()
  {
    if (j <= 0) {
      return (List)endOfData();
    }
    ImmutableList localImmutableList = ImmutableList.copyOf(list);
    calculateNextPermutation();
    return localImmutableList;
  }
  
  void switchDirection()
  {
    o[j] = (-o[j]);
    j -= 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Collections2.PermutationIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */