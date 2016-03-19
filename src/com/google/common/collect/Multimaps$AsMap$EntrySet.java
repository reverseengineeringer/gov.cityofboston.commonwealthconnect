package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class Multimaps$AsMap$EntrySet
  extends Maps.EntrySet<K, Collection<V>>
{
  Multimaps$AsMap$EntrySet(Multimaps.AsMap paramAsMap) {}
  
  public Iterator<Map.Entry<K, Collection<V>>> iterator()
  {
    Maps.asMapEntryIterator(Multimaps.AsMap.access$200(this$0).keySet(), new Function()
    {
      public Collection<V> apply(K paramAnonymousK)
      {
        return Multimaps.AsMap.access$200(this$0).get(paramAnonymousK);
      }
    });
  }
  
  Map<K, Collection<V>> map()
  {
    return this$0;
  }
  
  public boolean remove(Object paramObject)
  {
    if (!contains(paramObject)) {
      return false;
    }
    paramObject = (Map.Entry)paramObject;
    this$0.removeValuesForKey(((Map.Entry)paramObject).getKey());
    return true;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.AsMap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */