package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Synchronized$SynchronizedAsMap<K, V>
  extends Synchronized.SynchronizedMap<K, Collection<V>>
{
  private static final long serialVersionUID = 0L;
  transient Set<Map.Entry<K, Collection<V>>> asMapEntrySet;
  transient Collection<Collection<V>> asMapValues;
  
  Synchronized$SynchronizedAsMap(Map<K, Collection<V>> paramMap, @Nullable Object paramObject)
  {
    super(paramMap, paramObject);
  }
  
  public boolean containsValue(Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  public Set<Map.Entry<K, Collection<V>>> entrySet()
  {
    synchronized (mutex)
    {
      if (asMapEntrySet == null) {
        asMapEntrySet = new Synchronized.SynchronizedAsMapEntries(delegate().entrySet(), mutex);
      }
      Set localSet = asMapEntrySet;
      return localSet;
    }
  }
  
  public Collection<V> get(Object paramObject)
  {
    synchronized (mutex)
    {
      paramObject = (Collection)super.get(paramObject);
      if (paramObject == null)
      {
        paramObject = null;
        return (Collection<V>)paramObject;
      }
      paramObject = Synchronized.access$400((Collection)paramObject, mutex);
    }
  }
  
  public Collection<Collection<V>> values()
  {
    synchronized (mutex)
    {
      if (asMapValues == null) {
        asMapValues = new Synchronized.SynchronizedAsMapValues(delegate().values(), mutex);
      }
      Collection localCollection = asMapValues;
      return localCollection;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedAsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */