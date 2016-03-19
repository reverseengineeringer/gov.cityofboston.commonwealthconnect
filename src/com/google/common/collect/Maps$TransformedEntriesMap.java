package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class Maps$TransformedEntriesMap<K, V1, V2>
  extends Maps.ImprovedAbstractMap<K, V2>
{
  final Map<K, V1> fromMap;
  final Maps.EntryTransformer<? super K, ? super V1, V2> transformer;
  
  Maps$TransformedEntriesMap(Map<K, V1> paramMap, Maps.EntryTransformer<? super K, ? super V1, V2> paramEntryTransformer)
  {
    fromMap = ((Map)Preconditions.checkNotNull(paramMap));
    transformer = ((Maps.EntryTransformer)Preconditions.checkNotNull(paramEntryTransformer));
  }
  
  public void clear()
  {
    fromMap.clear();
  }
  
  public boolean containsKey(Object paramObject)
  {
    return fromMap.containsKey(paramObject);
  }
  
  protected Set<Map.Entry<K, V2>> createEntrySet()
  {
    new Maps.EntrySet()
    {
      public Iterator<Map.Entry<K, V2>> iterator()
      {
        return Iterators.transform(fromMap.entrySet().iterator(), Maps.asEntryToEntryFunction(transformer));
      }
      
      Map<K, V2> map()
      {
        return Maps.TransformedEntriesMap.this;
      }
    };
  }
  
  public V2 get(Object paramObject)
  {
    Object localObject = fromMap.get(paramObject);
    if ((localObject != null) || (fromMap.containsKey(paramObject))) {
      return (V2)transformer.transformEntry(paramObject, localObject);
    }
    return null;
  }
  
  public Set<K> keySet()
  {
    return fromMap.keySet();
  }
  
  public V2 remove(Object paramObject)
  {
    if (fromMap.containsKey(paramObject)) {
      return (V2)transformer.transformEntry(paramObject, fromMap.remove(paramObject));
    }
    return null;
  }
  
  public int size()
  {
    return fromMap.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.TransformedEntriesMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */