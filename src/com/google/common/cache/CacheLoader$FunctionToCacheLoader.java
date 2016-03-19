package com.google.common.cache;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.io.Serializable;

final class CacheLoader$FunctionToCacheLoader<K, V>
  extends CacheLoader<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final Function<K, V> computingFunction;
  
  public CacheLoader$FunctionToCacheLoader(Function<K, V> paramFunction)
  {
    computingFunction = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  public V load(K paramK)
  {
    return (V)computingFunction.apply(Preconditions.checkNotNull(paramK));
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheLoader.FunctionToCacheLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */