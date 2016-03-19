package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.EnumSet;
import java.util.Set;

final class MultimapBuilder$EnumSetSupplier<V extends Enum<V>>
  implements Supplier<Set<V>>, Serializable
{
  private final Class<V> clazz;
  
  MultimapBuilder$EnumSetSupplier(Class<V> paramClass)
  {
    clazz = ((Class)Preconditions.checkNotNull(paramClass));
  }
  
  public Set<V> get()
  {
    return EnumSet.noneOf(clazz);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MultimapBuilder.EnumSetSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */