package com.google.common.collect;

import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class MapConstraints$ConstrainedMultimap$1
  extends ForwardingMap<K, Collection<V>>
{
  Set<Map.Entry<K, Collection<V>>> entrySet;
  Collection<Collection<V>> values;
  
  MapConstraints$ConstrainedMultimap$1(MapConstraints.ConstrainedMultimap paramConstrainedMultimap, Map paramMap) {}
  
  public boolean containsValue(Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  protected Map<K, Collection<V>> delegate()
  {
    return val$asMapDelegate;
  }
  
  public Set<Map.Entry<K, Collection<V>>> entrySet()
  {
    Set localSet2 = entrySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = MapConstraints.access$200(val$asMapDelegate.entrySet(), this$0.constraint);
      entrySet = localSet1;
    }
    return localSet1;
  }
  
  public Collection<V> get(Object paramObject)
  {
    try
    {
      paramObject = this$0.get(paramObject);
      boolean bool = ((Collection)paramObject).isEmpty();
      if (bool) {
        paramObject = null;
      }
      return (Collection<V>)paramObject;
    }
    catch (ClassCastException paramObject) {}
    return null;
  }
  
  public Collection<Collection<V>> values()
  {
    Collection localCollection = values;
    Object localObject = localCollection;
    if (localCollection == null)
    {
      localObject = new MapConstraints.ConstrainedAsMapValues(delegate().values(), entrySet());
      values = ((Collection)localObject);
    }
    return (Collection<Collection<V>>)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedMultimap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */