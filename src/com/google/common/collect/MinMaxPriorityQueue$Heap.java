package com.google.common.collect;

import com.google.common.base.Preconditions;

class MinMaxPriorityQueue$Heap
{
  final Ordering<E> ordering;
  MinMaxPriorityQueue<E>.Heap otherHeap;
  
  MinMaxPriorityQueue$Heap(Ordering<E> paramOrdering)
  {
    Ordering localOrdering;
    ordering = localOrdering;
  }
  
  private int getGrandparentIndex(int paramInt)
  {
    return getParentIndex(getParentIndex(paramInt));
  }
  
  private int getLeftChildIndex(int paramInt)
  {
    return paramInt * 2 + 1;
  }
  
  private int getParentIndex(int paramInt)
  {
    return (paramInt - 1) / 2;
  }
  
  private int getRightChildIndex(int paramInt)
  {
    return paramInt * 2 + 2;
  }
  
  private boolean verifyIndex(int paramInt)
  {
    if ((getLeftChildIndex(paramInt) < MinMaxPriorityQueue.access$600(this$0)) && (compareElements(paramInt, getLeftChildIndex(paramInt)) > 0)) {}
    while (((getRightChildIndex(paramInt) < MinMaxPriorityQueue.access$600(this$0)) && (compareElements(paramInt, getRightChildIndex(paramInt)) > 0)) || ((paramInt > 0) && (compareElements(paramInt, getParentIndex(paramInt)) > 0)) || ((paramInt > 2) && (compareElements(getGrandparentIndex(paramInt), paramInt) > 0))) {
      return false;
    }
    return true;
  }
  
  void bubbleUp(int paramInt, E paramE)
  {
    int i = crossOverUp(paramInt, paramE);
    if (i == paramInt) {}
    for (Heap localHeap = this;; localHeap = otherHeap)
    {
      localHeap.bubbleUpAlternatingLevels(paramInt, paramE);
      return;
      paramInt = i;
    }
  }
  
  int bubbleUpAlternatingLevels(int paramInt, E paramE)
  {
    for (;;)
    {
      int i;
      Object localObject;
      if (paramInt > 2)
      {
        i = getGrandparentIndex(paramInt);
        localObject = this$0.elementData(i);
        if (ordering.compare(localObject, paramE) > 0) {}
      }
      else
      {
        MinMaxPriorityQueue.access$500(this$0)[paramInt] = paramE;
        return paramInt;
      }
      MinMaxPriorityQueue.access$500(this$0)[paramInt] = localObject;
      paramInt = i;
    }
  }
  
  int compareElements(int paramInt1, int paramInt2)
  {
    return ordering.compare(this$0.elementData(paramInt1), this$0.elementData(paramInt2));
  }
  
  int crossOver(int paramInt, E paramE)
  {
    int i = findMinChild(paramInt);
    if ((i > 0) && (ordering.compare(this$0.elementData(i), paramE) < 0))
    {
      MinMaxPriorityQueue.access$500(this$0)[paramInt] = this$0.elementData(i);
      MinMaxPriorityQueue.access$500(this$0)[i] = paramE;
      return i;
    }
    return crossOverUp(paramInt, paramE);
  }
  
  int crossOverUp(int paramInt, E paramE)
  {
    if (paramInt == 0)
    {
      MinMaxPriorityQueue.access$500(this$0)[0] = paramE;
      return 0;
    }
    int j = getParentIndex(paramInt);
    Object localObject2 = this$0.elementData(j);
    Object localObject1 = localObject2;
    int i = j;
    if (j != 0)
    {
      int k = getRightChildIndex(getParentIndex(j));
      localObject1 = localObject2;
      i = j;
      if (k != j)
      {
        localObject1 = localObject2;
        i = j;
        if (getLeftChildIndex(k) >= MinMaxPriorityQueue.access$600(this$0))
        {
          Object localObject3 = this$0.elementData(k);
          localObject1 = localObject2;
          i = j;
          if (ordering.compare(localObject3, localObject2) < 0)
          {
            i = k;
            localObject1 = localObject3;
          }
        }
      }
    }
    if (ordering.compare(localObject1, paramE) < 0)
    {
      MinMaxPriorityQueue.access$500(this$0)[paramInt] = localObject1;
      MinMaxPriorityQueue.access$500(this$0)[i] = paramE;
      return i;
    }
    MinMaxPriorityQueue.access$500(this$0)[paramInt] = paramE;
    return paramInt;
  }
  
  int fillHoleAt(int paramInt)
  {
    for (;;)
    {
      int i = findMinGrandChild(paramInt);
      if (i <= 0) {
        break;
      }
      MinMaxPriorityQueue.access$500(this$0)[paramInt] = this$0.elementData(i);
      paramInt = i;
    }
    return paramInt;
  }
  
  int findMin(int paramInt1, int paramInt2)
  {
    int j;
    if (paramInt1 >= MinMaxPriorityQueue.access$600(this$0))
    {
      j = -1;
      return j;
    }
    if (paramInt1 > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      int k = Math.min(paramInt1, MinMaxPriorityQueue.access$600(this$0) - paramInt2);
      int i = paramInt1;
      paramInt1 += 1;
      for (;;)
      {
        j = i;
        if (paramInt1 >= k + paramInt2) {
          break;
        }
        j = i;
        if (compareElements(paramInt1, i) < 0) {
          j = paramInt1;
        }
        paramInt1 += 1;
        i = j;
      }
    }
  }
  
  int findMinChild(int paramInt)
  {
    return findMin(getLeftChildIndex(paramInt), 2);
  }
  
  int findMinGrandChild(int paramInt)
  {
    paramInt = getLeftChildIndex(paramInt);
    if (paramInt < 0) {
      return -1;
    }
    return findMin(getLeftChildIndex(paramInt), 4);
  }
  
  int getCorrectLastElement(E paramE)
  {
    int i = getParentIndex(MinMaxPriorityQueue.access$600(this$0));
    if (i != 0)
    {
      int j = getRightChildIndex(getParentIndex(i));
      if ((j != i) && (getLeftChildIndex(j) >= MinMaxPriorityQueue.access$600(this$0)))
      {
        Object localObject = this$0.elementData(j);
        if (ordering.compare(localObject, paramE) < 0)
        {
          MinMaxPriorityQueue.access$500(this$0)[j] = paramE;
          MinMaxPriorityQueue.access$500(this$0)[MinMaxPriorityQueue.access$600(this$0)] = localObject;
          return j;
        }
      }
    }
    return MinMaxPriorityQueue.access$600(this$0);
  }
  
  MinMaxPriorityQueue.MoveDesc<E> tryCrossOverAndBubbleUp(int paramInt1, int paramInt2, E paramE)
  {
    int i = crossOver(paramInt2, paramE);
    if (i == paramInt2) {}
    for (;;)
    {
      return null;
      if (i < paramInt1) {}
      for (Object localObject = this$0.elementData(paramInt1); otherHeap.bubbleUpAlternatingLevels(i, paramE) < paramInt1; localObject = this$0.elementData(getParentIndex(paramInt1))) {
        return new MinMaxPriorityQueue.MoveDesc(paramE, localObject);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MinMaxPriorityQueue.Heap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */