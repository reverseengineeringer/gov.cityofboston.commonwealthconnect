package com.google.common.collect;

import com.google.common.base.Preconditions;

class ImmutableList$SubList
  extends ImmutableList<E>
{
  final transient int length;
  final transient int offset;
  
  ImmutableList$SubList(ImmutableList paramImmutableList, int paramInt1, int paramInt2)
  {
    offset = paramInt1;
    length = paramInt2;
  }
  
  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, length);
    return (E)this$0.get(offset + paramInt);
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return length;
  }
  
  public ImmutableList<E> subList(int paramInt1, int paramInt2)
  {
    Preconditions.checkPositionIndexes(paramInt1, paramInt2, length);
    return this$0.subList(offset + paramInt1, offset + paramInt2);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableList.SubList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */