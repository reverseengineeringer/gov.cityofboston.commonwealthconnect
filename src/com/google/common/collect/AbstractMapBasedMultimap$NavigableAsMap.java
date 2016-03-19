package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;

@GwtIncompatible("NavigableAsMap")
class AbstractMapBasedMultimap$NavigableAsMap
  extends AbstractMapBasedMultimap<K, V>.SortedAsMap
  implements NavigableMap<K, Collection<V>>
{
  AbstractMapBasedMultimap$NavigableAsMap(NavigableMap<K, Collection<V>> paramNavigableMap)
  {
    super(paramNavigableMap, localSortedMap);
  }
  
  public Map.Entry<K, Collection<V>> ceilingEntry(K paramK)
  {
    paramK = sortedMap().ceilingEntry(paramK);
    if (paramK == null) {
      return null;
    }
    return wrapEntry(paramK);
  }
  
  public K ceilingKey(K paramK)
  {
    return (K)sortedMap().ceilingKey(paramK);
  }
  
  NavigableSet<K> createKeySet()
  {
    return new AbstractMapBasedMultimap.NavigableKeySet(this$0, sortedMap());
  }
  
  public NavigableSet<K> descendingKeySet()
  {
    return descendingMap().navigableKeySet();
  }
  
  public NavigableMap<K, Collection<V>> descendingMap()
  {
    return new NavigableAsMap(this$0, sortedMap().descendingMap());
  }
  
  public Map.Entry<K, Collection<V>> firstEntry()
  {
    Map.Entry localEntry = sortedMap().firstEntry();
    if (localEntry == null) {
      return null;
    }
    return wrapEntry(localEntry);
  }
  
  public Map.Entry<K, Collection<V>> floorEntry(K paramK)
  {
    paramK = sortedMap().floorEntry(paramK);
    if (paramK == null) {
      return null;
    }
    return wrapEntry(paramK);
  }
  
  public K floorKey(K paramK)
  {
    return (K)sortedMap().floorKey(paramK);
  }
  
  public NavigableMap<K, Collection<V>> headMap(K paramK)
  {
    return headMap(paramK, false);
  }
  
  public NavigableMap<K, Collection<V>> headMap(K paramK, boolean paramBoolean)
  {
    return new NavigableAsMap(this$0, sortedMap().headMap(paramK, paramBoolean));
  }
  
  public Map.Entry<K, Collection<V>> higherEntry(K paramK)
  {
    paramK = sortedMap().higherEntry(paramK);
    if (paramK == null) {
      return null;
    }
    return wrapEntry(paramK);
  }
  
  public K higherKey(K paramK)
  {
    return (K)sortedMap().higherKey(paramK);
  }
  
  public NavigableSet<K> keySet()
  {
    return (NavigableSet)super.keySet();
  }
  
  public Map.Entry<K, Collection<V>> lastEntry()
  {
    Map.Entry localEntry = sortedMap().lastEntry();
    if (localEntry == null) {
      return null;
    }
    return wrapEntry(localEntry);
  }
  
  public Map.Entry<K, Collection<V>> lowerEntry(K paramK)
  {
    paramK = sortedMap().lowerEntry(paramK);
    if (paramK == null) {
      return null;
    }
    return wrapEntry(paramK);
  }
  
  public K lowerKey(K paramK)
  {
    return (K)sortedMap().lowerKey(paramK);
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    return keySet();
  }
  
  Map.Entry<K, Collection<V>> pollAsMapEntry(Iterator<Map.Entry<K, Collection<V>>> paramIterator)
  {
    if (!paramIterator.hasNext()) {
      return null;
    }
    Map.Entry localEntry = (Map.Entry)paramIterator.next();
    Collection localCollection = this$0.createCollection();
    localCollection.addAll((Collection)localEntry.getValue());
    paramIterator.remove();
    return Maps.immutableEntry(localEntry.getKey(), this$0.unmodifiableCollectionSubclass(localCollection));
  }
  
  public Map.Entry<K, Collection<V>> pollFirstEntry()
  {
    return pollAsMapEntry(entrySet().iterator());
  }
  
  public Map.Entry<K, Collection<V>> pollLastEntry()
  {
    return pollAsMapEntry(descendingMap().entrySet().iterator());
  }
  
  NavigableMap<K, Collection<V>> sortedMap()
  {
    return (NavigableMap)super.sortedMap();
  }
  
  public NavigableMap<K, Collection<V>> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }
  
  public NavigableMap<K, Collection<V>> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return new NavigableAsMap(this$0, sortedMap().subMap(paramK1, paramBoolean1, paramK2, paramBoolean2));
  }
  
  public NavigableMap<K, Collection<V>> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }
  
  public NavigableMap<K, Collection<V>> tailMap(K paramK, boolean paramBoolean)
  {
    return new NavigableAsMap(this$0, sortedMap().tailMap(paramK, paramBoolean));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.NavigableAsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */