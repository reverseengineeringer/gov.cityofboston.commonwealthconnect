package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Map;

class HashBasedTable$Factory<C, V>
  implements Supplier<Map<C, V>>, Serializable
{
  private static final long serialVersionUID = 0L;
  final int expectedSize;
  
  HashBasedTable$Factory(int paramInt)
  {
    expectedSize = paramInt;
  }
  
  public Map<C, V> get()
  {
    return Maps.newHashMapWithExpectedSize(expectedSize);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.HashBasedTable.Factory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */