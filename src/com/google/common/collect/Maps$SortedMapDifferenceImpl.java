package com.google.common.collect;

import java.util.SortedMap;

class Maps$SortedMapDifferenceImpl<K, V>
  extends Maps.MapDifferenceImpl<K, V>
  implements SortedMapDifference<K, V>
{
  Maps$SortedMapDifferenceImpl(SortedMap<K, V> paramSortedMap1, SortedMap<K, V> paramSortedMap2, SortedMap<K, V> paramSortedMap3, SortedMap<K, MapDifference.ValueDifference<V>> paramSortedMap)
  {
    super(paramSortedMap1, paramSortedMap2, paramSortedMap3, paramSortedMap);
  }
  
  public SortedMap<K, MapDifference.ValueDifference<V>> entriesDiffering()
  {
    return (SortedMap)super.entriesDiffering();
  }
  
  public SortedMap<K, V> entriesInCommon()
  {
    return (SortedMap)super.entriesInCommon();
  }
  
  public SortedMap<K, V> entriesOnlyOnLeft()
  {
    return (SortedMap)super.entriesOnlyOnLeft();
  }
  
  public SortedMap<K, V> entriesOnlyOnRight()
  {
    return (SortedMap)super.entriesOnlyOnRight();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.SortedMapDifferenceImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */