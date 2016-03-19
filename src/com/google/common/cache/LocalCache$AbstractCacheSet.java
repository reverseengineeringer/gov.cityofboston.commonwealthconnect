package com.google.common.cache;

import java.util.AbstractSet;
import java.util.concurrent.ConcurrentMap;

abstract class LocalCache$AbstractCacheSet<T>
  extends AbstractSet<T>
{
  final ConcurrentMap<?, ?> map;
  
  LocalCache$AbstractCacheSet(ConcurrentMap<?, ?> paramConcurrentMap)
  {
    ConcurrentMap localConcurrentMap;
    map = localConcurrentMap;
  }
  
  public void clear()
  {
    map.clear();
  }
  
  public boolean isEmpty()
  {
    return map.isEmpty();
  }
  
  public int size()
  {
    return map.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.AbstractCacheSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */