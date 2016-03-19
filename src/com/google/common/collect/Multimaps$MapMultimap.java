package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NoSuchElementException;
import java.util.Set;

class Multimaps$MapMultimap<K, V>
  extends AbstractMultimap<K, V>
  implements SetMultimap<K, V>, Serializable
{
  private static final long serialVersionUID = 7845222491160860175L;
  final Map<K, V> map;
  
  Multimaps$MapMultimap(Map<K, V> paramMap)
  {
    map = ((Map)Preconditions.checkNotNull(paramMap));
  }
  
  public void clear()
  {
    map.clear();
  }
  
  public boolean containsEntry(Object paramObject1, Object paramObject2)
  {
    return map.entrySet().contains(Maps.immutableEntry(paramObject1, paramObject2));
  }
  
  public boolean containsKey(Object paramObject)
  {
    return map.containsKey(paramObject);
  }
  
  public boolean containsValue(Object paramObject)
  {
    return map.containsValue(paramObject);
  }
  
  Map<K, Collection<V>> createAsMap()
  {
    return new Multimaps.AsMap(this);
  }
  
  public Set<Map.Entry<K, V>> entries()
  {
    return map.entrySet();
  }
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    return map.entrySet().iterator();
  }
  
  public Set<V> get(final K paramK)
  {
    new Sets.ImprovedAbstractSet()
    {
      public Iterator<V> iterator()
      {
        new Iterator()
        {
          int i;
          
          public boolean hasNext()
          {
            return (i == 0) && (map.containsKey(val$key));
          }
          
          public V next()
          {
            if (!hasNext()) {
              throw new NoSuchElementException();
            }
            i += 1;
            return (V)map.get(val$key);
          }
          
          public void remove()
          {
            boolean bool = true;
            if (i == 1) {}
            for (;;)
            {
              CollectPreconditions.checkRemove(bool);
              i = -1;
              map.remove(val$key);
              return;
              bool = false;
            }
          }
        };
      }
      
      public int size()
      {
        if (map.containsKey(paramK)) {
          return 1;
        }
        return 0;
      }
    };
  }
  
  public int hashCode()
  {
    return map.hashCode();
  }
  
  public Set<K> keySet()
  {
    return map.keySet();
  }
  
  public boolean put(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean putAll(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean remove(Object paramObject1, Object paramObject2)
  {
    return map.entrySet().remove(Maps.immutableEntry(paramObject1, paramObject2));
  }
  
  public Set<V> removeAll(Object paramObject)
  {
    HashSet localHashSet = new HashSet(2);
    if (!map.containsKey(paramObject)) {
      return localHashSet;
    }
    localHashSet.add(map.remove(paramObject));
    return localHashSet;
  }
  
  public Set<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public int size()
  {
    return map.size();
  }
  
  public Collection<V> values()
  {
    return map.values();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.MapMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */