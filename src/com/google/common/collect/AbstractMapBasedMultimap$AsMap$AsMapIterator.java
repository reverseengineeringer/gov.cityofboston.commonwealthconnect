package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class AbstractMapBasedMultimap$AsMap$AsMapIterator
  implements Iterator<Map.Entry<K, Collection<V>>>
{
  Collection<V> collection;
  final Iterator<Map.Entry<K, Collection<V>>> delegateIterator = this$1.submap.entrySet().iterator();
  
  AbstractMapBasedMultimap$AsMap$AsMapIterator(AbstractMapBasedMultimap.AsMap paramAsMap) {}
  
  public boolean hasNext()
  {
    return delegateIterator.hasNext();
  }
  
  public Map.Entry<K, Collection<V>> next()
  {
    Map.Entry localEntry = (Map.Entry)delegateIterator.next();
    collection = ((Collection)localEntry.getValue());
    return this$1.wrapEntry(localEntry);
  }
  
  public void remove()
  {
    delegateIterator.remove();
    AbstractMapBasedMultimap.access$220(this$1.this$0, collection.size());
    collection.clear();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.AsMap.AsMapIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */