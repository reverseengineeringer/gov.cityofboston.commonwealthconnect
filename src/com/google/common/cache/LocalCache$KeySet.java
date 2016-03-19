package com.google.common.cache;

import java.util.Iterator;
import java.util.concurrent.ConcurrentMap;

final class LocalCache$KeySet
  extends LocalCache<K, V>.AbstractCacheSet<K>
{
  LocalCache$KeySet(ConcurrentMap<?, ?> paramConcurrentMap)
  {
    super(paramConcurrentMap, localConcurrentMap);
  }
  
  public boolean contains(Object paramObject)
  {
    return map.containsKey(paramObject);
  }
  
  public Iterator<K> iterator()
  {
    return new LocalCache.KeyIterator(this$0);
  }
  
  public boolean remove(Object paramObject)
  {
    return map.remove(paramObject) != null;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.KeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */