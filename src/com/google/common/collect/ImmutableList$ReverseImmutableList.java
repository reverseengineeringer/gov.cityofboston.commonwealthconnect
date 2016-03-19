package com.google.common.collect;

import com.google.common.base.Preconditions;
import javax.annotation.Nullable;

class ImmutableList$ReverseImmutableList<E>
  extends ImmutableList<E>
{
  private final transient ImmutableList<E> forwardList;
  
  ImmutableList$ReverseImmutableList(ImmutableList<E> paramImmutableList)
  {
    forwardList = paramImmutableList;
  }
  
  private int reverseIndex(int paramInt)
  {
    return size() - 1 - paramInt;
  }
  
  private int reversePosition(int paramInt)
  {
    return size() - paramInt;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return forwardList.contains(paramObject);
  }
  
  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    return (E)forwardList.get(reverseIndex(paramInt));
  }
  
  public int indexOf(@Nullable Object paramObject)
  {
    int i = forwardList.lastIndexOf(paramObject);
    if (i >= 0) {
      return reverseIndex(i);
    }
    return -1;
  }
  
  boolean isPartialView()
  {
    return forwardList.isPartialView();
  }
  
  public int lastIndexOf(@Nullable Object paramObject)
  {
    int i = forwardList.indexOf(paramObject);
    if (i >= 0) {
      return reverseIndex(i);
    }
    return -1;
  }
  
  public ImmutableList<E> reverse()
  {
    return forwardList;
  }
  
  public int size()
  {
    return forwardList.size();
  }
  
  public ImmutableList<E> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, size());
    return forwardList.subList(reversePosition(paramInt2), reversePosition(paramInt1)).reverse();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableList.ReverseImmutableList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */