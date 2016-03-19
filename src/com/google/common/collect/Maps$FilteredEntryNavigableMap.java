package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableMap")
class Maps$FilteredEntryNavigableMap<K, V>
  extends AbstractNavigableMap<K, V>
{
  private final Predicate<? super Map.Entry<K, V>> entryPredicate;
  private final Map<K, V> filteredDelegate;
  private final NavigableMap<K, V> unfiltered;
  
  Maps$FilteredEntryNavigableMap(NavigableMap<K, V> paramNavigableMap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    unfiltered = ((NavigableMap)Preconditions.checkNotNull(paramNavigableMap));
    entryPredicate = paramPredicate;
    filteredDelegate = new Maps.FilteredEntryMap(paramNavigableMap, paramPredicate);
  }
  
  public void clear()
  {
    filteredDelegate.clear();
  }
  
  public Comparator<? super K> comparator()
  {
    return unfiltered.comparator();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return filteredDelegate.containsKey(paramObject);
  }
  
  Iterator<Map.Entry<K, V>> descendingEntryIterator()
  {
    return Iterators.filter(unfiltered.descendingMap().entrySet().iterator(), entryPredicate);
  }
  
  public NavigableMap<K, V> descendingMap()
  {
    return Maps.filterEntries(unfiltered.descendingMap(), entryPredicate);
  }
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    return Iterators.filter(unfiltered.entrySet().iterator(), entryPredicate);
  }
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    return filteredDelegate.entrySet();
  }
  
  @Nullable
  public V get(@Nullable Object paramObject)
  {
    return (V)filteredDelegate.get(paramObject);
  }
  
  public NavigableMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    return Maps.filterEntries(unfiltered.headMap(paramK, paramBoolean), entryPredicate);
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    new Maps.NavigableKeySet(this)
    {
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return Iterators.removeIf(unfiltered.entrySet().iterator(), Predicates.and(entryPredicate, Maps.keyPredicateOnEntries(Predicates.in(paramAnonymousCollection))));
      }
      
      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return Iterators.removeIf(unfiltered.entrySet().iterator(), Predicates.and(entryPredicate, Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection)))));
      }
    };
  }
  
  public Map.Entry<K, V> pollFirstEntry()
  {
    return (Map.Entry)Iterables.removeFirstMatching(unfiltered.entrySet(), entryPredicate);
  }
  
  public Map.Entry<K, V> pollLastEntry()
  {
    return (Map.Entry)Iterables.removeFirstMatching(unfiltered.descendingMap().entrySet(), entryPredicate);
  }
  
  public V put(K paramK, V paramV)
  {
    return (V)filteredDelegate.put(paramK, paramV);
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    filteredDelegate.putAll(paramMap);
  }
  
  public V remove(@Nullable Object paramObject)
  {
    return (V)filteredDelegate.remove(paramObject);
  }
  
  public int size()
  {
    return filteredDelegate.size();
  }
  
  public NavigableMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return Maps.filterEntries(unfiltered.subMap(paramK1, paramBoolean1, paramK2, paramBoolean2), entryPredicate);
  }
  
  public NavigableMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    return Maps.filterEntries(unfiltered.tailMap(paramK, paramBoolean), entryPredicate);
  }
  
  public Collection<V> values()
  {
    return new Maps.FilteredMapValues(this, unfiltered, entryPredicate);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryNavigableMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */