package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

final class MultimapBuilder$ArrayListSupplier<V>
  implements Supplier<List<V>>, Serializable
{
  private final int expectedValuesPerKey;
  
  MultimapBuilder$ArrayListSupplier(int paramInt)
  {
    expectedValuesPerKey = CollectPreconditions.checkNonnegative(paramInt, "expectedValuesPerKey");
  }
  
  public List<V> get()
  {
    return new ArrayList(expectedValuesPerKey);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.ArrayListSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */