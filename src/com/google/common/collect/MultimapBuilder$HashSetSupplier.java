package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

final class MultimapBuilder$HashSetSupplier<V>
  implements Supplier<Set<V>>, Serializable
{
  private final int expectedValuesPerKey;
  
  MultimapBuilder$HashSetSupplier(int paramInt)
  {
    expectedValuesPerKey = CollectPreconditions.checkNonnegative(paramInt, "expectedValuesPerKey");
  }
  
  public Set<V> get()
  {
    return new HashSet(expectedValuesPerKey);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.HashSetSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */