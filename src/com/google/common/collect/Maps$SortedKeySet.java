package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedMap;
import java.util.SortedSet;

class Maps$SortedKeySet<K, V>
  extends Maps.KeySet<K, V>
  implements SortedSet<K>
{
  Maps$SortedKeySet(SortedMap<K, V> paramSortedMap)
  {
    super(paramSortedMap);
  }
  
  public Comparator<? super K> comparator()
  {
    return map().comparator();
  }
  
  public K first()
  {
    return (K)map().firstKey();
  }
  
  public SortedSet<K> headSet(K paramK)
  {
    return new SortedKeySet(map().headMap(paramK));
  }
  
  public K last()
  {
    return (K)map().lastKey();
  }
  
  SortedMap<K, V> map()
  {
    return (SortedMap)super.map();
  }
  
  public SortedSet<K> subSet(K paramK1, K paramK2)
  {
    return new SortedKeySet(map().subMap(paramK1, paramK2));
  }
  
  public SortedSet<K> tailSet(K paramK)
  {
    return new SortedKeySet(map().tailMap(paramK));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.SortedKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */