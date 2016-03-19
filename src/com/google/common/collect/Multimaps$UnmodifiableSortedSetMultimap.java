package com.google.common.collect;

import java.util.Collections;
import java.util.Comparator;
import java.util.SortedSet;

class Multimaps$UnmodifiableSortedSetMultimap<K, V>
  extends Multimaps.UnmodifiableSetMultimap<K, V>
  implements SortedSetMultimap<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Multimaps$UnmodifiableSortedSetMultimap(SortedSetMultimap<K, V> paramSortedSetMultimap)
  {
    super(paramSortedSetMultimap);
  }
  
  public SortedSetMultimap<K, V> delegate()
  {
    return (SortedSetMultimap)super.delegate();
  }
  
  public SortedSet<V> get(K paramK)
  {
    return Collections.unmodifiableSortedSet(delegate().get(paramK));
  }
  
  public SortedSet<V> removeAll(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public SortedSet<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public Comparator<? super V> valueComparator()
  {
    return delegate().valueComparator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.UnmodifiableSortedSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */