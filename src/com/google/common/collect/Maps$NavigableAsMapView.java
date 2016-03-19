package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableMap")
final class Maps$NavigableAsMapView<K, V>
  extends AbstractNavigableMap<K, V>
{
  private final Function<? super K, V> function;
  private final NavigableSet<K> set;
  
  Maps$NavigableAsMapView(NavigableSet<K> paramNavigableSet, Function<? super K, V> paramFunction)
  {
    set = ((NavigableSet)Preconditions.checkNotNull(paramNavigableSet));
    function = ((Function)Preconditions.checkNotNull(paramFunction));
  }
  
  public void clear()
  {
    set.clear();
  }
  
  public Comparator<? super K> comparator()
  {
    return set.comparator();
  }
  
  Iterator<Map.Entry<K, V>> descendingEntryIterator()
  {
    return descendingMap().entrySet().iterator();
  }
  
  public NavigableMap<K, V> descendingMap()
  {
    return Maps.asMap(set.descendingSet(), function);
  }
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    return Maps.asMapEntryIterator(set, function);
  }
  
  @Nullable
  public V get(@Nullable Object paramObject)
  {
    if (Collections2.safeContains(set, paramObject)) {
      return (V)function.apply(paramObject);
    }
    return null;
  }
  
  public NavigableMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    return Maps.asMap(set.headSet(paramK, paramBoolean), function);
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    return Maps.access$400(set);
  }
  
  public int size()
  {
    return set.size();
  }
  
  public NavigableMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return Maps.asMap(set.subSet(paramK1, paramBoolean1, paramK2, paramBoolean2), function);
  }
  
  public NavigableMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    return Maps.asMap(set.tailSet(paramK, paramBoolean), function);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.NavigableAsMapView
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */