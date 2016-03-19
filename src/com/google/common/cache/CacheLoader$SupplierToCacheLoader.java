package com.google.common.cache;

import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;

final class CacheLoader$SupplierToCacheLoader<V>
  extends CacheLoader<Object, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final Supplier<V> computingSupplier;
  
  public CacheLoader$SupplierToCacheLoader(Supplier<V> paramSupplier)
  {
    computingSupplier = ((Supplier)Preconditions.checkNotNull(paramSupplier));
  }
  
  public V load(Object paramObject)
  {
    Preconditions.checkNotNull(paramObject);
    return (V)computingSupplier.get();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheLoader.SupplierToCacheLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */