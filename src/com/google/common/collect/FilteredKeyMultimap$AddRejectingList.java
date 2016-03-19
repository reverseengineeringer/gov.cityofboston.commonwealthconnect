package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

class FilteredKeyMultimap$AddRejectingList<K, V>
  extends ForwardingList<V>
{
  final K key;
  
  FilteredKeyMultimap$AddRejectingList(K paramK)
  {
    key = paramK;
  }
  
  public void add(int paramInt, V paramV)
  {
    Preconditions.checkPositionIndex(paramInt, 0);
    throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
  }
  
  public boolean add(V paramV)
  {
    add(0, paramV);
    return true;
  }
  
  public boolean addAll(int paramInt, Collection<? extends V> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    Preconditions.checkPositionIndex(paramInt, 0);
    throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
  }
  
  public boolean addAll(Collection<? extends V> paramCollection)
  {
    addAll(0, paramCollection);
    return true;
  }
  
  protected List<V> delegate()
  {
    return Collections.emptyList();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredKeyMultimap.AddRejectingList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */