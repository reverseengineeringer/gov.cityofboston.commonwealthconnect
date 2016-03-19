package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Synchronized$SynchronizedMultimap<K, V>
  extends Synchronized.SynchronizedObject
  implements Multimap<K, V>
{
  private static final long serialVersionUID = 0L;
  transient Map<K, Collection<V>> asMap;
  transient Collection<Map.Entry<K, V>> entries;
  transient Set<K> keySet;
  transient Multiset<K> keys;
  transient Collection<V> valuesCollection;
  
  Synchronized$SynchronizedMultimap(Multimap<K, V> paramMultimap, @Nullable Object paramObject)
  {
    super(paramMultimap, paramObject);
  }
  
  public Map<K, Collection<V>> asMap()
  {
    synchronized (mutex)
    {
      if (asMap == null) {
        asMap = new Synchronized.SynchronizedAsMap(delegate().asMap(), mutex);
      }
      Map localMap = asMap;
      return localMap;
    }
  }
  
  public void clear()
  {
    synchronized (mutex)
    {
      delegate().clear();
      return;
    }
  }
  
  public boolean containsEntry(Object paramObject1, Object paramObject2)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().containsEntry(paramObject1, paramObject2);
      return bool;
    }
  }
  
  public boolean containsKey(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().containsKey(paramObject);
      return bool;
    }
  }
  
  public boolean containsValue(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().containsValue(paramObject);
      return bool;
    }
  }
  
  Multimap<K, V> delegate()
  {
    return (Multimap)super.delegate();
  }
  
  public Collection<Map.Entry<K, V>> entries()
  {
    synchronized (mutex)
    {
      if (entries == null) {
        entries = Synchronized.access$400(delegate().entries(), mutex);
      }
      Collection localCollection = entries;
      return localCollection;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    synchronized (mutex)
    {
      boolean bool = delegate().equals(paramObject);
      return bool;
    }
  }
  
  public Collection<V> get(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$400(delegate().get(paramK), mutex);
      return paramK;
    }
  }
  
  public int hashCode()
  {
    synchronized (mutex)
    {
      int i = delegate().hashCode();
      return i;
    }
  }
  
  public boolean isEmpty()
  {
    synchronized (mutex)
    {
      boolean bool = delegate().isEmpty();
      return bool;
    }
  }
  
  public Set<K> keySet()
  {
    synchronized (mutex)
    {
      if (keySet == null) {
        keySet = Synchronized.access$300(delegate().keySet(), mutex);
      }
      Set localSet = keySet;
      return localSet;
    }
  }
  
  public Multiset<K> keys()
  {
    synchronized (mutex)
    {
      if (keys == null) {
        keys = Synchronized.multiset(delegate().keys(), mutex);
      }
      Multiset localMultiset = keys;
      return localMultiset;
    }
  }
  
  public boolean put(K paramK, V paramV)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().put(paramK, paramV);
      return bool;
    }
  }
  
  public boolean putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().putAll(paramMultimap);
      return bool;
    }
  }
  
  public boolean putAll(K paramK, Iterable<? extends V> paramIterable)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().putAll(paramK, paramIterable);
      return bool;
    }
  }
  
  public boolean remove(Object paramObject1, Object paramObject2)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().remove(paramObject1, paramObject2);
      return bool;
    }
  }
  
  public Collection<V> removeAll(Object paramObject)
  {
    synchronized (mutex)
    {
      paramObject = delegate().removeAll(paramObject);
      return (Collection<V>)paramObject;
    }
  }
  
  public Collection<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    synchronized (mutex)
    {
      paramK = delegate().replaceValues(paramK, paramIterable);
      return paramK;
    }
  }
  
  public int size()
  {
    synchronized (mutex)
    {
      int i = delegate().size();
      return i;
    }
  }
  
  public Collection<V> values()
  {
    synchronized (mutex)
    {
      if (valuesCollection == null) {
        valuesCollection = Synchronized.access$500(delegate().values(), mutex);
      }
      Collection localCollection = valuesCollection;
      return localCollection;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */