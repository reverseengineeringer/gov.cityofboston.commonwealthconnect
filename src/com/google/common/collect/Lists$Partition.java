package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.math.IntMath;
import java.math.RoundingMode;
import java.util.AbstractList;
import java.util.List;

class Lists$Partition<T>
  extends AbstractList<List<T>>
{
  final List<T> list;
  final int size;
  
  Lists$Partition(List<T> paramList, int paramInt)
  {
    list = paramList;
    size = paramInt;
  }
  
  public List<T> get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    paramInt *= size;
    int i = Math.min(size + paramInt, list.size());
    return list.subList(paramInt, i);
  }
  
  public boolean isEmpty()
  {
    return list.isEmpty();
  }
  
  public int size()
  {
    return IntMath.divide(list.size(), size, RoundingMode.CEILING);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.Partition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */