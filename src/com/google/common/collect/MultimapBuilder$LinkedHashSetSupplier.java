package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

final class MultimapBuilder$LinkedHashSetSupplier<V>
  implements Supplier<Set<V>>, Serializable
{
  private final int expectedValuesPerKey;
  
  MultimapBuilder$LinkedHashSetSupplier(int paramInt)
  {
    expectedValuesPerKey = CollectPreconditions.checkNonnegative(paramInt, "expectedValuesPerKey");
  }
  
  public Set<V> get()
  {
    return new LinkedHashSet(expectedValuesPerKey);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.LinkedHashSetSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */