package com.google.common.cache;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.util.concurrent.ExecutionException;

class LocalCache$LocalLoadingCache<K, V>
  extends LocalCache.LocalManualCache<K, V>
  implements LoadingCache<K, V>
{
  private static final long serialVersionUID = 1L;
  
  LocalCache$LocalLoadingCache(CacheBuilder<? super K, ? super V> paramCacheBuilder, CacheLoader<? super K, V> paramCacheLoader)
  {
    super(new LocalCache(paramCacheBuilder, (CacheLoader)Preconditions.checkNotNull(paramCacheLoader)), null);
  }
  
  public final V apply(K paramK)
  {
    return (V)getUnchecked(paramK);
  }
  
  public V get(K paramK)
    throws ExecutionException
  {
    return (V)localCache.getOrLoad(paramK);
  }
  
  public ImmutableMap<K, V> getAll(Iterable<? extends K> paramIterable)
    throws ExecutionException
  {
    return localCache.getAll(paramIterable);
  }
  
  public V getUnchecked(K paramK)
  {
    try
    {
      paramK = get(paramK);
      return paramK;
    }
    catch (ExecutionException paramK)
    {
      throw new UncheckedExecutionException(paramK.getCause());
    }
  }
  
  public void refresh(K paramK)
  {
    localCache.refresh(paramK);
  }
  
  Object writeReplace()
  {
    return new LocalCache.LoadingSerializationProxy(localCache);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.LocalLoadingCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */