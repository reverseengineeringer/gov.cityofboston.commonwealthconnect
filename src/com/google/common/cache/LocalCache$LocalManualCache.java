package com.google.common.cache;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import java.io.Serializable;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;
import javax.annotation.Nullable;

class LocalCache$LocalManualCache<K, V>
  implements Cache<K, V>, Serializable
{
  private static final long serialVersionUID = 1L;
  final LocalCache<K, V> localCache;
  
  LocalCache$LocalManualCache(CacheBuilder<? super K, ? super V> paramCacheBuilder)
  {
    this(new LocalCache(paramCacheBuilder, null));
  }
  
  private LocalCache$LocalManualCache(LocalCache<K, V> paramLocalCache)
  {
    localCache = paramLocalCache;
  }
  
  public ConcurrentMap<K, V> asMap()
  {
    return localCache;
  }
  
  public void cleanUp()
  {
    localCache.cleanUp();
  }
  
  public V get(K paramK, final Callable<? extends V> paramCallable)
    throws ExecutionException
  {
    Preconditions.checkNotNull(paramCallable);
    (V)localCache.get(paramK, new CacheLoader()
    {
      public V load(Object paramAnonymousObject)
        throws Exception
      {
        return (V)paramCallable.call();
      }
    });
  }
  
  public ImmutableMap<K, V> getAllPresent(Iterable<?> paramIterable)
  {
    return localCache.getAllPresent(paramIterable);
  }
  
  @Nullable
  public V getIfPresent(Object paramObject)
  {
    return (V)localCache.getIfPresent(paramObject);
  }
  
  public void invalidate(Object paramObject)
  {
    Preconditions.checkNotNull(paramObject);
    localCache.remove(paramObject);
  }
  
  public void invalidateAll()
  {
    localCache.clear();
  }
  
  public void invalidateAll(Iterable<?> paramIterable)
  {
    localCache.invalidateAll(paramIterable);
  }
  
  public void put(K paramK, V paramV)
  {
    localCache.put(paramK, paramV);
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    localCache.putAll(paramMap);
  }
  
  public long size()
  {
    return localCache.longSize();
  }
  
  public CacheStats stats()
  {
    AbstractCache.SimpleStatsCounter localSimpleStatsCounter = new AbstractCache.SimpleStatsCounter();
    localSimpleStatsCounter.incrementBy(localCache.globalStatsCounter);
    LocalCache.Segment[] arrayOfSegment = localCache.segments;
    int j = arrayOfSegment.length;
    int i = 0;
    while (i < j)
    {
      localSimpleStatsCounter.incrementBy(statsCounter);
      i += 1;
    }
    return localSimpleStatsCounter.snapshot();
  }
  
  Object writeReplace()
  {
    return new LocalCache.ManualSerializationProxy(localCache);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.LocalManualCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */