package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Iterator;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.SortedSet;

@GwtIncompatible("NavigableMap")
class Maps$NavigableKeySet<K, V>
  extends Maps.SortedKeySet<K, V>
  implements NavigableSet<K>
{
  Maps$NavigableKeySet(NavigableMap<K, V> paramNavigableMap)
  {
    super(paramNavigableMap);
  }
  
  public K ceiling(K paramK)
  {
    return (K)map().ceilingKey(paramK);
  }
  
  public Iterator<K> descendingIterator()
  {
    return descendingSet().iterator();
  }
  
  public NavigableSet<K> descendingSet()
  {
    return map().descendingKeySet();
  }
  
  public K floor(K paramK)
  {
    return (K)map().floorKey(paramK);
  }
  
  public NavigableSet<K> headSet(K paramK, boolean paramBoolean)
  {
    return map().headMap(paramK, paramBoolean).navigableKeySet();
  }
  
  public SortedSet<K> headSet(K paramK)
  {
    return headSet(paramK, false);
  }
  
  public K higher(K paramK)
  {
    return (K)map().higherKey(paramK);
  }
  
  public K lower(K paramK)
  {
    return (K)map().lowerKey(paramK);
  }
  
  NavigableMap<K, V> map()
  {
    return (NavigableMap)map;
  }
  
  public K pollFirst()
  {
    return (K)Maps.keyOrNull(map().pollFirstEntry());
  }
  
  public K pollLast()
  {
    return (K)Maps.keyOrNull(map().pollLastEntry());
  }
  
  public NavigableSet<K> subSet(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return map().subMap(paramK1, paramBoolean1, paramK2, paramBoolean2).navigableKeySet();
  }
  
  public SortedSet<K> subSet(K paramK1, K paramK2)
  {
    return subSet(paramK1, true, paramK2, false);
  }
  
  public NavigableSet<K> tailSet(K paramK, boolean paramBoolean)
  {
    return map().tailMap(paramK, paramBoolean).navigableKeySet();
  }
  
  public SortedSet<K> tailSet(K paramK)
  {
    return tailSet(paramK, true);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.NavigableKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */