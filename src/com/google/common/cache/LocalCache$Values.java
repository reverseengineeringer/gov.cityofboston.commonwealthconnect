package com.google.common.cache;

import java.util.AbstractCollection;
import java.util.Iterator;
import java.util.concurrent.ConcurrentMap;

final class LocalCache$Values
  extends AbstractCollection<V>
{
  private final ConcurrentMap<?, ?> map;
  
  LocalCache$Values(ConcurrentMap<?, ?> paramConcurrentMap)
  {
    ConcurrentMap localConcurrentMap;
    map = localConcurrentMap;
  }
  
  public void clear()
  {
    map.clear();
  }
  
  public boolean contains(Object paramObject)
  {
    return map.containsValue(paramObject);
  }
  
  public boolean isEmpty()
  {
    return map.isEmpty();
  }
  
  public Iterator<V> iterator()
  {
    return new LocalCache.ValueIterator(this$0);
  }
  
  public int size()
  {
    return map.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.Values
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */