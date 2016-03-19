package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Iterator;
import java.util.NavigableSet;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableSet")
class AbstractMapBasedMultimap$WrappedNavigableSet
  extends AbstractMapBasedMultimap<K, V>.WrappedSortedSet
  implements NavigableSet<V>
{
  AbstractMapBasedMultimap$WrappedNavigableSet(@Nullable K paramK, NavigableSet<V> paramNavigableSet, @Nullable AbstractMapBasedMultimap<K, V>.WrappedCollection paramAbstractMapBasedMultimap)
  {
    super(paramK, paramNavigableSet, paramAbstractMapBasedMultimap, localWrappedCollection);
  }
  
  private NavigableSet<V> wrap(NavigableSet<V> paramNavigableSet)
  {
    AbstractMapBasedMultimap localAbstractMapBasedMultimap = this$0;
    Object localObject2 = key;
    if (getAncestor() == null) {}
    for (Object localObject1 = this;; localObject1 = getAncestor()) {
      return new WrappedNavigableSet(localAbstractMapBasedMultimap, localObject2, paramNavigableSet, (AbstractMapBasedMultimap.WrappedCollection)localObject1);
    }
  }
  
  public V ceiling(V paramV)
  {
    return (V)getSortedSetDelegate().ceiling(paramV);
  }
  
  public Iterator<V> descendingIterator()
  {
    return new AbstractMapBasedMultimap.WrappedCollection.WrappedIterator(this, getSortedSetDelegate().descendingIterator());
  }
  
  public NavigableSet<V> descendingSet()
  {
    return wrap(getSortedSetDelegate().descendingSet());
  }
  
  public V floor(V paramV)
  {
    return (V)getSortedSetDelegate().floor(paramV);
  }
  
  NavigableSet<V> getSortedSetDelegate()
  {
    return (NavigableSet)super.getSortedSetDelegate();
  }
  
  public NavigableSet<V> headSet(V paramV, boolean paramBoolean)
  {
    return wrap(getSortedSetDelegate().headSet(paramV, paramBoolean));
  }
  
  public V higher(V paramV)
  {
    return (V)getSortedSetDelegate().higher(paramV);
  }
  
  public V lower(V paramV)
  {
    return (V)getSortedSetDelegate().lower(paramV);
  }
  
  public V pollFirst()
  {
    return (V)Iterators.pollNext(iterator());
  }
  
  public V pollLast()
  {
    return (V)Iterators.pollNext(descendingIterator());
  }
  
  public NavigableSet<V> subSet(V paramV1, boolean paramBoolean1, V paramV2, boolean paramBoolean2)
  {
    return wrap(getSortedSetDelegate().subSet(paramV1, paramBoolean1, paramV2, paramBoolean2));
  }
  
  public NavigableSet<V> tailSet(V paramV, boolean paramBoolean)
  {
    return wrap(getSortedSetDelegate().tailSet(paramV, paramBoolean));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.WrappedNavigableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */