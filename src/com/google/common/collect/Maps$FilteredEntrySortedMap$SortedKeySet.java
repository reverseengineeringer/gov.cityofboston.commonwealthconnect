package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedMap;
import java.util.SortedSet;

class Maps$FilteredEntrySortedMap$SortedKeySet
  extends Maps.FilteredEntryMap<K, V>.KeySet
  implements SortedSet<K>
{
  Maps$FilteredEntrySortedMap$SortedKeySet(Maps.FilteredEntrySortedMap paramFilteredEntrySortedMap)
  {
    super(paramFilteredEntrySortedMap);
  }
  
  public Comparator<? super K> comparator()
  {
    return this$0.sortedMap().comparator();
  }
  
  public K first()
  {
    return (K)this$0.firstKey();
  }
  
  public SortedSet<K> headSet(K paramK)
  {
    return (SortedSet)this$0.headMap(paramK).keySet();
  }
  
  public K last()
  {
    return (K)this$0.lastKey();
  }
  
  public SortedSet<K> subSet(K paramK1, K paramK2)
  {
    return (SortedSet)this$0.subMap(paramK1, paramK2).keySet();
  }
  
  public SortedSet<K> tailSet(K paramK)
  {
    return (SortedSet)this$0.tailMap(paramK).keySet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntrySortedMap.SortedKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */