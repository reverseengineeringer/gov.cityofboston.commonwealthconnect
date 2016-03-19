package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedMap;

class Maps$TransformedEntriesSortedMap<K, V1, V2>
  extends Maps.TransformedEntriesMap<K, V1, V2>
  implements SortedMap<K, V2>
{
  Maps$TransformedEntriesSortedMap(SortedMap<K, V1> paramSortedMap, Maps.EntryTransformer<? super K, ? super V1, V2> paramEntryTransformer)
  {
    super(paramSortedMap, paramEntryTransformer);
  }
  
  public Comparator<? super K> comparator()
  {
    return fromMap().comparator();
  }
  
  public K firstKey()
  {
    return (K)fromMap().firstKey();
  }
  
  protected SortedMap<K, V1> fromMap()
  {
    return (SortedMap)fromMap;
  }
  
  public SortedMap<K, V2> headMap(K paramK)
  {
    return Maps.transformEntries(fromMap().headMap(paramK), transformer);
  }
  
  public K lastKey()
  {
    return (K)fromMap().lastKey();
  }
  
  public SortedMap<K, V2> subMap(K paramK1, K paramK2)
  {
    return Maps.transformEntries(fromMap().subMap(paramK1, paramK2), transformer);
  }
  
  public SortedMap<K, V2> tailMap(K paramK)
  {
    return Maps.transformEntries(fromMap().tailMap(paramK), transformer);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.TransformedEntriesSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */