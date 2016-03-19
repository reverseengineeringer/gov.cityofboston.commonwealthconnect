package com.google.common.cache;

final class CacheBuilder$1
  implements AbstractCache.StatsCounter
{
  public void recordEviction() {}
  
  public void recordHits(int paramInt) {}
  
  public void recordLoadException(long paramLong) {}
  
  public void recordLoadSuccess(long paramLong) {}
  
  public void recordMisses(int paramInt) {}
  
  public CacheStats snapshot()
  {
    return CacheBuilder.EMPTY_STATS;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilder.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */