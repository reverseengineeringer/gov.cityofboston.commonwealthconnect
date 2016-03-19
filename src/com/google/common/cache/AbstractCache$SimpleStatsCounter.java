package com.google.common.cache;

import com.google.common.annotations.Beta;

@Beta
public final class AbstractCache$SimpleStatsCounter
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

/* Location:
 * Qualified Name:     com.google.common.cache.AbstractCache.SimpleStatsCounter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */