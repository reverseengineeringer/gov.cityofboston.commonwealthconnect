package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
abstract interface FilteredSetMultimap<K, V>
  extends FilteredMultimap<K, V>, SetMultimap<K, V>
{
  public abstract SetMultimap<K, V> unfiltered();
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */