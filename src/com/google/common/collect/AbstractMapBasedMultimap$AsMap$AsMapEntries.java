package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class AbstractMapBasedMultimap$AsMap$AsMapEntries
  extends Maps.EntrySet<K, Collection<V>>
{
  AbstractMapBasedMultimap$AsMap$AsMapEntries(AbstractMapBasedMultimap.AsMap paramAsMap) {}
  
  public boolean contains(Object paramObject)
  {
    return Collections2.safeContains(this$1.submap.entrySet(), paramObject);
  }
  
  public Iterator<Map.Entry<K, Collection<V>>> iterator()
  {
    return new AbstractMapBasedMultimap.AsMap.AsMapIterator(this$1);
  }
  
  Map<K, Collection<V>> map()
  {
    return this$1;
  }
  
  public boolean remove(Object paramObject)
  {
    if (!contains(paramObject)) {
      return false;
    }
    paramObject = (Map.Entry)paramObject;
    AbstractMapBasedMultimap.access$400(this$1.this$0, ((Map.Entry)paramObject).getKey());
    return true;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.AsMap.AsMapEntries
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */