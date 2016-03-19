package com.google.common.collect;

import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.SortedMap;
import java.util.SortedSet;

class AbstractMapBasedMultimap$SortedAsMap
  extends AbstractMapBasedMultimap<K, V>.AsMap
  implements SortedMap<K, Collection<V>>
{
  SortedSet<K> sortedKeySet;
  
  AbstractMapBasedMultimap$SortedAsMap(SortedMap<K, Collection<V>> paramSortedMap)
  {
    super(paramSortedMap, localMap);
  }
  
  public Comparator<? super K> comparator()
  {
    return sortedMap().comparator();
  }
  
  SortedSet<K> createKeySet()
  {
    return new AbstractMapBasedMultimap.SortedKeySet(this$0, sortedMap());
  }
  
  public K firstKey()
  {
    return (K)sortedMap().firstKey();
  }
  
  public SortedMap<K, Collection<V>> headMap(K paramK)
  {
    return new SortedAsMap(this$0, sortedMap().headMap(paramK));
  }
  
  public SortedSet<K> keySet()
  {
    SortedSet localSortedSet2 = sortedKeySet;
    SortedSet localSortedSet1 = localSortedSet2;
    if (localSortedSet2 == null)
    {
      localSortedSet1 = createKeySet();
      sortedKeySet = localSortedSet1;
    }
    return localSortedSet1;
  }
  
  public K lastKey()
  {
    return (K)sortedMap().lastKey();
  }
  
  SortedMap<K, Collection<V>> sortedMap()
  {
    return (SortedMap)submap;
  }
  
  public SortedMap<K, Collection<V>> subMap(K paramK1, K paramK2)
  {
    return new SortedAsMap(this$0, sortedMap().subMap(paramK1, paramK2));
  }
  
  public SortedMap<K, Collection<V>> tailMap(K paramK)
  {
    return new SortedAsMap(this$0, sortedMap().tailMap(paramK));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.SortedAsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */