package com.google.common.collect;

import java.util.List;
import java.util.RandomAccess;

class Lists$RandomAccessPartition<T>
  extends Lists.Partition<T>
  implements RandomAccess
{
  Lists$RandomAccessPartition(List<T> paramList, int paramInt)
  {
    super(paramList, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.RandomAccessPartition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */