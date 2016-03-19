package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Collection;
import java.util.Iterator;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.SortedMap;

@GwtIncompatible("NavigableSet")
class AbstractMapBasedMultimap$NavigableKeySet
  extends AbstractMapBasedMultimap<K, V>.SortedKeySet
  implements NavigableSet<K>
{
  AbstractMapBasedMultimap$NavigableKeySet(NavigableMap<K, Collection<V>> paramNavigableMap)
  {
    super(paramNavigableMap, localSortedMap);
  }
  
  public K ceiling(K paramK)
  {
    return (K)sortedMap().ceilingKey(paramK);
  }
  
  public Iterator<K> descendingIterator()
  {
    return descendingSet().iterator();
  }
  
  public NavigableSet<K> descendingSet()
  {
    return new NavigableKeySet(this$0, sortedMap().descendingMap());
  }
  
  public K floor(K paramK)
  {
    return (K)sortedMap().floorKey(paramK);
  }
  
  public NavigableSet<K> headSet(K paramK)
  {
    return headSet(paramK, false);
  }
  
  public NavigableSet<K> headSet(K paramK, boolean paramBoolean)
  {
    return new NavigableKeySet(this$0, sortedMap().headMap(paramK, paramBoolean));
  }
  
  public K higher(K paramK)
  {
    return (K)sortedMap().higherKey(paramK);
  }
  
  public K lower(K paramK)
  {
    return (K)sortedMap().lowerKey(paramK);
  }
  
  public K pollFirst()
  {
    return (K)Iterators.pollNext(iterator());
  }
  
  public K pollLast()
  {
    return (K)Iterators.pollNext(descendingIterator());
  }
  
  NavigableMap<K, Collection<V>> sortedMap()
  {
    return (NavigableMap)super.sortedMap();
  }
  
  public NavigableSet<K> subSet(K paramK1, K paramK2)
  {
    return subSet(paramK1, true, paramK2, false);
  }
  
  public NavigableSet<K> subSet(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return new NavigableKeySet(this$0, sortedMap().subMap(paramK1, paramBoolean1, paramK2, paramBoolean2));
  }
  
  public NavigableSet<K> tailSet(K paramK)
  {
    return tailSet(paramK, true);
  }
  
  public NavigableSet<K> tailSet(K paramK, boolean paramBoolean)
  {
    return new NavigableKeySet(this$0, sortedMap().tailMap(paramK, paramBoolean));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.NavigableKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */