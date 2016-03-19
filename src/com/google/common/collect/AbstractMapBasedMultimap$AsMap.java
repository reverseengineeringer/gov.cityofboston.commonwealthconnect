package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$AsMap
  extends Maps.ImprovedAbstractMap<K, Collection<V>>
{
  final transient Map<K, Collection<V>> submap;
  
  AbstractMapBasedMultimap$AsMap(Map<K, Collection<V>> paramMap)
  {
    Map localMap;
    submap = localMap;
  }
  
  public void clear()
  {
    if (submap == AbstractMapBasedMultimap.access$000(this$0))
    {
      this$0.clear();
      return;
    }
    Iterators.clear(new AsMapIterator());
  }
  
  public boolean containsKey(Object paramObject)
  {
    return Maps.safeContainsKey(submap, paramObject);
  }
  
  protected Set<Map.Entry<K, Collection<V>>> createEntrySet()
  {
    return new AsMapEntries();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return (this == paramObject) || (submap.equals(paramObject));
  }
  
  public Collection<V> get(Object paramObject)
  {
    Collection localCollection = (Collection)Maps.safeGet(submap, paramObject);
    if (localCollection == null) {
      return null;
    }
    return this$0.wrapCollection(paramObject, localCollection);
  }
  
  public int hashCode()
  {
    return submap.hashCode();
  }
  
  public Set<K> keySet()
  {
    return this$0.keySet();
  }
  
  public Collection<V> remove(Object paramObject)
  {
    paramObject = (Collection)submap.remove(paramObject);
    if (paramObject == null) {
      return null;
    }
    Collection localCollection = this$0.createCollection();
    localCollection.addAll((Collection)paramObject);
    AbstractMapBasedMultimap.access$220(this$0, ((Collection)paramObject).size());
    ((Collection)paramObject).clear();
    return localCollection;
  }
  
  public int size()
  {
    return submap.size();
  }
  
  public String toString()
  {
    return submap.toString();
  }
  
  Map.Entry<K, Collection<V>> wrapEntry(Map.Entry<K, Collection<V>> paramEntry)
  {
    Object localObject = paramEntry.getKey();
    return Maps.immutableEntry(localObject, this$0.wrapCollection(localObject, (Collection)paramEntry.getValue()));
  }
  
  class AsMapEntries
    extends Maps.EntrySet<K, Collection<V>>
  {
    AsMapEntries() {}
    
    public boolean contains(Object paramObject)
    {
      return Collections2.safeContains(submap.entrySet(), paramObject);
    }
    
    public Iterator<Map.Entry<K, Collection<V>>> iterator()
    {
      return new AbstractMapBasedMultimap.AsMap.AsMapIterator(AbstractMapBasedMultimap.AsMap.this);
    }
    
    Map<K, Collection<V>> map()
    {
      return AbstractMapBasedMultimap.AsMap.this;
    }
    
    public boolean remove(Object paramObject)
    {
      if (!contains(paramObject)) {
        return false;
      }
      paramObject = (Map.Entry)paramObject;
      AbstractMapBasedMultimap.access$400(this$0, ((Map.Entry)paramObject).getKey());
      return true;
    }
  }
  
  class AsMapIterator
    implements Iterator<Map.Entry<K, Collection<V>>>
  {
    Collection<V> collection;
    final Iterator<Map.Entry<K, Collection<V>>> delegateIterator = submap.entrySet().iterator();
    
    AsMapIterator() {}
    
    public boolean hasNext()
    {
      return delegateIterator.hasNext();
    }
    
    public Map.Entry<K, Collection<V>> next()
    {
      Map.Entry localEntry = (Map.Entry)delegateIterator.next();
      collection = ((Collection)localEntry.getValue());
      return wrapEntry(localEntry);
    }
    
    public void remove()
    {
      delegateIterator.remove();
      AbstractMapBasedMultimap.access$220(this$0, collection.size());
      collection.clear();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.AsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */