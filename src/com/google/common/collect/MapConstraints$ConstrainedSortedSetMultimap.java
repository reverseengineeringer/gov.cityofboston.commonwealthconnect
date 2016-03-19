package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;

class MapConstraints$ConstrainedSortedSetMultimap<K, V>
  extends MapConstraints.ConstrainedSetMultimap<K, V>
  implements SortedSetMultimap<K, V>
{
  MapConstraints$ConstrainedSortedSetMultimap(SortedSetMultimap<K, V> paramSortedSetMultimap, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    super(paramSortedSetMultimap, paramMapConstraint);
  }
  
  public SortedSet<V> get(K paramK)
  {
    return (SortedSet)super.get(paramK);
  }
  
  public SortedSet<V> removeAll(Object paramObject)
  {
    return (SortedSet)super.removeAll(paramObject);
  }
  
  public SortedSet<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    return (SortedSet)super.replaceValues(paramK, paramIterable);
  }
  
  public Comparator<? super V> valueComparator()
  {
    return ((SortedSetMultimap)delegate()).valueComparator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedSortedSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */