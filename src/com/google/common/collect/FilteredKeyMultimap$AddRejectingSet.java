package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Collections;
import java.util.Set;

class FilteredKeyMultimap$AddRejectingSet<K, V>
  extends ForwardingSet<V>
{
  final K key;
  
  FilteredKeyMultimap$AddRejectingSet(K paramK)
  {
    key = paramK;
  }
  
  public boolean add(V paramV)
  {
    throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
  }
  
  public boolean addAll(Collection<? extends V> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
  }
  
  protected Set<V> delegate()
  {
    return Collections.emptySet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredKeyMultimap.AddRejectingSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */