package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class Multimaps$AsMap<K, V>
  extends Maps.ImprovedAbstractMap<K, Collection<V>>
{
  private final Multimap<K, V> multimap;
  
  Multimaps$AsMap(Multimap<K, V> paramMultimap)
  {
    multimap = ((Multimap)Preconditions.checkNotNull(paramMultimap));
  }
  
  public void clear()
  {
    multimap.clear();
  }
  
  public boolean containsKey(Object paramObject)
  {
    return multimap.containsKey(paramObject);
  }
  
  protected Set<Map.Entry<K, Collection<V>>> createEntrySet()
  {
    return new EntrySet();
  }
  
  public Collection<V> get(Object paramObject)
  {
    if (containsKey(paramObject)) {
      return multimap.get(paramObject);
    }
    return null;
  }
  
  public boolean isEmpty()
  {
    return multimap.isEmpty();
  }
  
  public Set<K> keySet()
  {
    return multimap.keySet();
  }
  
  public Collection<V> remove(Object paramObject)
  {
    if (containsKey(paramObject)) {
      return multimap.removeAll(paramObject);
    }
    return null;
  }
  
  void removeValuesForKey(Object paramObject)
  {
    multimap.keySet().remove(paramObject);
  }
  
  public int size()
  {
    return multimap.keySet().size();
  }
  
  class EntrySet
    extends Maps.EntrySet<K, Collection<V>>
  {
    EntrySet() {}
    
    public Iterator<Map.Entry<K, Collection<V>>> iterator()
    {
      Maps.asMapEntryIterator(multimap.keySet(), new Function()
      {
        public Collection<V> apply(K paramAnonymousK)
        {
          return multimap.get(paramAnonymousK);
        }
      });
    }
    
    Map<K, Collection<V>> map()
    {
      return Multimaps.AsMap.this;
    }
    
    public boolean remove(Object paramObject)
    {
      if (!contains(paramObject)) {
        return false;
      }
      paramObject = (Map.Entry)paramObject;
      removeValuesForKey(((Map.Entry)paramObject).getKey());
      return true;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.AsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */