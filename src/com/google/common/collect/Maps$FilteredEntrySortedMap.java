package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.SortedMap;
import java.util.SortedSet;

class Maps$FilteredEntrySortedMap<K, V>
  extends Maps.FilteredEntryMap<K, V>
  implements SortedMap<K, V>
{
  Maps$FilteredEntrySortedMap(SortedMap<K, V> paramSortedMap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    super(paramSortedMap, paramPredicate);
  }
  
  public Comparator<? super K> comparator()
  {
    return sortedMap().comparator();
  }
  
  SortedSet<K> createKeySet()
  {
    return new SortedKeySet();
  }
  
  public K firstKey()
  {
    return (K)keySet().iterator().next();
  }
  
  public SortedMap<K, V> headMap(K paramK)
  {
    return new FilteredEntrySortedMap(sortedMap().headMap(paramK), predicate);
  }
  
  public SortedSet<K> keySet()
  {
    return (SortedSet)super.keySet();
  }
  
  public K lastKey()
  {
    for (Object localObject = sortedMap();; localObject = sortedMap().headMap(localObject))
    {
      localObject = ((SortedMap)localObject).lastKey();
      if (apply(localObject, unfiltered.get(localObject))) {
        return (K)localObject;
      }
    }
  }
  
  SortedMap<K, V> sortedMap()
  {
    return (SortedMap)unfiltered;
  }
  
  public SortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return new FilteredEntrySortedMap(sortedMap().subMap(paramK1, paramK2), predicate);
  }
  
  public SortedMap<K, V> tailMap(K paramK)
  {
    return new FilteredEntrySortedMap(sortedMap().tailMap(paramK), predicate);
  }
  
  class SortedKeySet
    extends Maps.FilteredEntryMap<K, V>.KeySet
    implements SortedSet<K>
  {
    SortedKeySet()
    {
      super();
    }
    
    public Comparator<? super K> comparator()
    {
      return sortedMap().comparator();
    }
    
    public K first()
    {
      return (K)firstKey();
    }
    
    public SortedSet<K> headSet(K paramK)
    {
      return (SortedSet)headMap(paramK).keySet();
    }
    
    public K last()
    {
      return (K)lastKey();
    }
    
    public SortedSet<K> subSet(K paramK1, K paramK2)
    {
      return (SortedSet)subMap(paramK1, paramK2).keySet();
    }
    
    public SortedSet<K> tailSet(K paramK)
    {
      return (SortedSet)tailMap(paramK).keySet();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntrySortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */