package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Comparator;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;

class Maps$SortedAsMapView<K, V>
  extends Maps.AsMapView<K, V>
  implements SortedMap<K, V>
{
  Maps$SortedAsMapView(SortedSet<K> paramSortedSet, Function<? super K, V> paramFunction)
  {
    super(paramSortedSet, paramFunction);
  }
  
  SortedSet<K> backingSet()
  {
    return (SortedSet)super.backingSet();
  }
  
  public Comparator<? super K> comparator()
  {
    return backingSet().comparator();
  }
  
  public K firstKey()
  {
    return (K)backingSet().first();
  }
  
  public SortedMap<K, V> headMap(K paramK)
  {
    return Maps.asMap(backingSet().headSet(paramK), function);
  }
  
  public Set<K> keySet()
  {
    return Maps.access$300(backingSet());
  }
  
  public K lastKey()
  {
    return (K)backingSet().last();
  }
  
  public SortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return Maps.asMap(backingSet().subSet(paramK1, paramK2), function);
  }
  
  public SortedMap<K, V> tailMap(K paramK)
  {
    return Maps.asMap(backingSet().tailSet(paramK), function);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.SortedAsMapView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */