package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutionException;

@Beta
@GwtCompatible
public abstract class AbstractCache<K, V>
  implements Cache<K, V>
{
  public ConcurrentMap<K, V> asMap()
  {
    throw new UnsupportedOperationException();
  }
  
  public void cleanUp() {}
  
  public V get(K paramK, Callable<? extends V> paramCallable)
    throws ExecutionException
  {
    throw new UnsupportedOperationException();
  }
  
  public ImmutableMap<K, V> getAllPresent(Iterable<?> paramIterable)
  {
    LinkedHashMap localLinkedHashMap = Maps.newLinkedHashMap();
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext())
    {
      Object localObject = paramIterable.next();
      if (!localLinkedHashMap.containsKey(localObject)) {
        localLinkedHashMap.put(localObject, getIfPresent(localObject));
      }
    }
    return ImmutableMap.copyOf(localLinkedHashMap);
  }
  
  public void invalidate(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public void invalidateAll()
  {
    throw new UnsupportedOperationException();
  }
  
  public void invalidateAll(Iterable<?> paramIterable)
  {
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext()) {
      invalidate(paramIterable.next());
    }
  }
  
  public void put(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      put(localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public long size()
  {
    throw new UnsupportedOperationException();
  }
  
  public CacheStats stats()
  {
    throw new UnsupportedOperationException();
  }
  
  @Beta
  public static final class SimpleStatsCounter
    implements AbstractCache.StatsCounter
  {
    private final LongAddable evictionCount = LongAddables.create();
    private final LongAddable hitCount = LongAddables.create();
    private final LongAddable loadExceptionCount = LongAddables.create();
    private final LongAddable loadSuccessCount = LongAddables.create();
    private final LongAddable missCount = LongAddables.create();
    private final LongAddable totalLoadTime = LongAddables.create();
    
    public void incrementBy(AbstractCache.StatsCounter paramStatsCounter)
    {
      paramStatsCounter = paramStatsCounter.snapshot();
      hitCount.add(paramStatsCounter.hitCount());
      missCount.add(paramStatsCounter.missCount());
      loadSuccessCount.add(paramStatsCounter.loadSuccessCount());
      loadExceptionCount.add(paramStatsCounter.loadExceptionCount());
      totalLoadTime.add(paramStatsCounter.totalLoadTime());
      evictionCount.add(paramStatsCounter.evictionCount());
    }
    
    public void recordEviction()
    {
      evictionCount.increment();
    }
    
    public void recordHits(int paramInt)
    {
      hitCount.add(paramInt);
    }
    
    public void recordLoadException(long paramLong)
    {
      loadExceptionCount.increment();
      totalLoadTime.add(paramLong);
    }
    
    public void recordLoadSuccess(long paramLong)
    {
      loadSuccessCount.increment();
      totalLoadTime.add(paramLong);
    }
    
    public void recordMisses(int paramInt)
    {
      missCount.add(paramInt);
    }
    
    public CacheStats snapshot()
    {
      return new CacheStats(hitCount.sum(), missCount.sum(), loadSuccessCount.sum(), loadExceptionCount.sum(), totalLoadTime.sum(), evictionCount.sum());
    }
  }
  
  @Beta
  public static abstract interface StatsCounter
  {
    public abstract void recordEviction();
    
    public abstract void recordHits(int paramInt);
    
    public abstract void recordLoadException(long paramLong);
    
    public abstract void recordLoadSuccess(long paramLong);
    
    public abstract void recordMisses(int paramInt);
    
    public abstract CacheStats snapshot();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.AbstractCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */