package com.google.common.collect;

import java.util.Collection;
import java.util.Comparator;
import java.util.Map;
import java.util.SortedMap;
import java.util.SortedSet;

class AbstractMapBasedMultimap$SortedKeySet
  extends AbstractMapBasedMultimap<K, V>.KeySet
  implements SortedSet<K>
{
  AbstractMapBasedMultimap$SortedKeySet(SortedMap<K, Collection<V>> paramSortedMap)
  {
    super(paramSortedMap, localMap);
  }
  
  public Comparator<? super K> comparator()
  {
    return sortedMap().comparator();
  }
  
  public K first()
  {
    return (K)sortedMap().firstKey();
  }
  
  public SortedSet<K> headSet(K paramK)
  {
    return new SortedKeySet(this$0, sortedMap().headMap(paramK));
  }
  
  public K last()
  {
    return (K)sortedMap().lastKey();
  }
  
  SortedMap<K, Collection<V>> sortedMap()
  {
    return (SortedMap)super.map();
  }
  
  public SortedSet<K> subSet(K paramK1, K paramK2)
  {
    return new SortedKeySet(this$0, sortedMap().subMap(paramK1, paramK2));
  }
  
  public SortedSet<K> tailSet(K paramK)
  {
    return new SortedKeySet(this$0, sortedMap().tailMap(paramK));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.SortedKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */