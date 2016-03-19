package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;
import java.util.Collections;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;

@GwtIncompatible("NavigableMap")
class Maps$UnmodifiableNavigableMap<K, V>
  extends ForwardingSortedMap<K, V>
  implements NavigableMap<K, V>, Serializable
{
  private final NavigableMap<K, V> delegate;
  private transient UnmodifiableNavigableMap<K, V> descendingMap;
  
  Maps$UnmodifiableNavigableMap(NavigableMap<K, V> paramNavigableMap)
  {
    delegate = paramNavigableMap;
  }
  
  Maps$UnmodifiableNavigableMap(NavigableMap<K, V> paramNavigableMap, UnmodifiableNavigableMap<K, V> paramUnmodifiableNavigableMap)
  {
    delegate = paramNavigableMap;
    descendingMap = paramUnmodifiableNavigableMap;
  }
  
  public Map.Entry<K, V> ceilingEntry(K paramK)
  {
    return Maps.access$800(delegate.ceilingEntry(paramK));
  }
  
  public K ceilingKey(K paramK)
  {
    return (K)delegate.ceilingKey(paramK);
  }
  
  protected SortedMap<K, V> delegate()
  {
    return Collections.unmodifiableSortedMap(delegate);
  }
  
  public NavigableSet<K> descendingKeySet()
  {
    return Sets.unmodifiableNavigableSet(delegate.descendingKeySet());
  }
  
  public NavigableMap<K, V> descendingMap()
  {
    UnmodifiableNavigableMap localUnmodifiableNavigableMap2 = descendingMap;
    UnmodifiableNavigableMap localUnmodifiableNavigableMap1 = localUnmodifiableNavigableMap2;
    if (localUnmodifiableNavigableMap2 == null)
    {
      localUnmodifiableNavigableMap1 = new UnmodifiableNavigableMap(delegate.descendingMap(), this);
      descendingMap = localUnmodifiableNavigableMap1;
    }
    return localUnmodifiableNavigableMap1;
  }
  
  public Map.Entry<K, V> firstEntry()
  {
    return Maps.access$800(delegate.firstEntry());
  }
  
  public Map.Entry<K, V> floorEntry(K paramK)
  {
    return Maps.access$800(delegate.floorEntry(paramK));
  }
  
  public K floorKey(K paramK)
  {
    return (K)delegate.floorKey(paramK);
  }
  
  public NavigableMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    return Maps.unmodifiableNavigableMap(delegate.headMap(paramK, paramBoolean));
  }
  
  public SortedMap<K, V> headMap(K paramK)
  {
    return headMap(paramK, false);
  }
  
  public Map.Entry<K, V> higherEntry(K paramK)
  {
    return Maps.access$800(delegate.higherEntry(paramK));
  }
  
  public K higherKey(K paramK)
  {
    return (K)delegate.higherKey(paramK);
  }
  
  public Set<K> keySet()
  {
    return navigableKeySet();
  }
  
  public Map.Entry<K, V> lastEntry()
  {
    return Maps.access$800(delegate.lastEntry());
  }
  
  public Map.Entry<K, V> lowerEntry(K paramK)
  {
    return Maps.access$800(delegate.lowerEntry(paramK));
  }
  
  public K lowerKey(K paramK)
  {
    return (K)delegate.lowerKey(paramK);
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    return Sets.unmodifiableNavigableSet(delegate.navigableKeySet());
  }
  
  public final Map.Entry<K, V> pollFirstEntry()
  {
    throw new UnsupportedOperationException();
  }
  
  public final Map.Entry<K, V> pollLastEntry()
  {
    throw new UnsupportedOperationException();
  }
  
  public NavigableMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return Maps.unmodifiableNavigableMap(delegate.subMap(paramK1, paramBoolean1, paramK2, paramBoolean2));
  }
  
  public SortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }
  
  public NavigableMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    return Maps.unmodifiableNavigableMap(delegate.tailMap(paramK, paramBoolean));
  }
  
  public SortedMap<K, V> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.UnmodifiableNavigableMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */