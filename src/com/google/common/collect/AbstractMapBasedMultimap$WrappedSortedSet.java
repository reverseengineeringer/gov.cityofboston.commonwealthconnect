package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$WrappedSortedSet
  extends AbstractMapBasedMultimap<K, V>.WrappedCollection
  implements SortedSet<V>
{
  AbstractMapBasedMultimap$WrappedSortedSet(@Nullable K paramK, SortedSet<V> paramSortedSet, @Nullable AbstractMapBasedMultimap<K, V>.WrappedCollection paramAbstractMapBasedMultimap)
  {
    super(paramK, paramSortedSet, paramAbstractMapBasedMultimap, localWrappedCollection);
  }
  
  public Comparator<? super V> comparator()
  {
    return getSortedSetDelegate().comparator();
  }
  
  public V first()
  {
    refreshIfEmpty();
    return (V)getSortedSetDelegate().first();
  }
  
  SortedSet<V> getSortedSetDelegate()
  {
    return (SortedSet)getDelegate();
  }
  
  public SortedSet<V> headSet(V paramV)
  {
    refreshIfEmpty();
    AbstractMapBasedMultimap localAbstractMapBasedMultimap = this$0;
    Object localObject = getKey();
    SortedSet localSortedSet = getSortedSetDelegate().headSet(paramV);
    if (getAncestor() == null) {}
    for (paramV = this;; paramV = getAncestor()) {
      return new WrappedSortedSet(localAbstractMapBasedMultimap, localObject, localSortedSet, paramV);
    }
  }
  
  public V last()
  {
    refreshIfEmpty();
    return (V)getSortedSetDelegate().last();
  }
  
  public SortedSet<V> subSet(V paramV1, V paramV2)
  {
    refreshIfEmpty();
    AbstractMapBasedMultimap localAbstractMapBasedMultimap = this$0;
    Object localObject = getKey();
    paramV2 = getSortedSetDelegate().subSet(paramV1, paramV2);
    if (getAncestor() == null) {}
    for (paramV1 = this;; paramV1 = getAncestor()) {
      return new WrappedSortedSet(localAbstractMapBasedMultimap, localObject, paramV2, paramV1);
    }
  }
  
  public SortedSet<V> tailSet(V paramV)
  {
    refreshIfEmpty();
    AbstractMapBasedMultimap localAbstractMapBasedMultimap = this$0;
    Object localObject = getKey();
    SortedSet localSortedSet = getSortedSetDelegate().tailSet(paramV);
    if (getAncestor() == null) {}
    for (paramV = this;; paramV = getAncestor()) {
      return new WrappedSortedSet(localAbstractMapBasedMultimap, localObject, localSortedSet, paramV);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.WrappedSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */