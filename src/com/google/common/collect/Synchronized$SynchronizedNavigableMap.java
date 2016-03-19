package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableMap")
@VisibleForTesting
class Synchronized$SynchronizedNavigableMap<K, V>
  extends Synchronized.SynchronizedSortedMap<K, V>
  implements NavigableMap<K, V>
{
  private static final long serialVersionUID = 0L;
  transient NavigableSet<K> descendingKeySet;
  transient NavigableMap<K, V> descendingMap;
  transient NavigableSet<K> navigableKeySet;
  
  Synchronized$SynchronizedNavigableMap(NavigableMap<K, V> paramNavigableMap, @Nullable Object paramObject)
  {
    super(paramNavigableMap, paramObject);
  }
  
  public Map.Entry<K, V> ceilingEntry(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$700(delegate().ceilingEntry(paramK), mutex);
      return paramK;
    }
  }
  
  public K ceilingKey(K paramK)
  {
    synchronized (mutex)
    {
      paramK = delegate().ceilingKey(paramK);
      return paramK;
    }
  }
  
  NavigableMap<K, V> delegate()
  {
    return (NavigableMap)super.delegate();
  }
  
  public NavigableSet<K> descendingKeySet()
  {
    synchronized (mutex)
    {
      if (descendingKeySet == null)
      {
        localNavigableSet = Synchronized.navigableSet(delegate().descendingKeySet(), mutex);
        descendingKeySet = localNavigableSet;
        return localNavigableSet;
      }
      NavigableSet localNavigableSet = descendingKeySet;
      return localNavigableSet;
    }
  }
  
  public NavigableMap<K, V> descendingMap()
  {
    synchronized (mutex)
    {
      if (descendingMap == null)
      {
        localNavigableMap = Synchronized.navigableMap(delegate().descendingMap(), mutex);
        descendingMap = localNavigableMap;
        return localNavigableMap;
      }
      NavigableMap localNavigableMap = descendingMap;
      return localNavigableMap;
    }
  }
  
  public Map.Entry<K, V> firstEntry()
  {
    synchronized (mutex)
    {
      Map.Entry localEntry = Synchronized.access$700(delegate().firstEntry(), mutex);
      return localEntry;
    }
  }
  
  public Map.Entry<K, V> floorEntry(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$700(delegate().floorEntry(paramK), mutex);
      return paramK;
    }
  }
  
  public K floorKey(K paramK)
  {
    synchronized (mutex)
    {
      paramK = delegate().floorKey(paramK);
      return paramK;
    }
  }
  
  public NavigableMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.navigableMap(delegate().headMap(paramK, paramBoolean), mutex);
      return paramK;
    }
  }
  
  public SortedMap<K, V> headMap(K paramK)
  {
    return headMap(paramK, false);
  }
  
  public Map.Entry<K, V> higherEntry(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$700(delegate().higherEntry(paramK), mutex);
      return paramK;
    }
  }
  
  public K higherKey(K paramK)
  {
    synchronized (mutex)
    {
      paramK = delegate().higherKey(paramK);
      return paramK;
    }
  }
  
  public Set<K> keySet()
  {
    return navigableKeySet();
  }
  
  public Map.Entry<K, V> lastEntry()
  {
    synchronized (mutex)
    {
      Map.Entry localEntry = Synchronized.access$700(delegate().lastEntry(), mutex);
      return localEntry;
    }
  }
  
  public Map.Entry<K, V> lowerEntry(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$700(delegate().lowerEntry(paramK), mutex);
      return paramK;
    }
  }
  
  public K lowerKey(K paramK)
  {
    synchronized (mutex)
    {
      paramK = delegate().lowerKey(paramK);
      return paramK;
    }
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    synchronized (mutex)
    {
      if (navigableKeySet == null)
      {
        localNavigableSet = Synchronized.navigableSet(delegate().navigableKeySet(), mutex);
        navigableKeySet = localNavigableSet;
        return localNavigableSet;
      }
      NavigableSet localNavigableSet = navigableKeySet;
      return localNavigableSet;
    }
  }
  
  public Map.Entry<K, V> pollFirstEntry()
  {
    synchronized (mutex)
    {
      Map.Entry localEntry = Synchronized.access$700(delegate().pollFirstEntry(), mutex);
      return localEntry;
    }
  }
  
  public Map.Entry<K, V> pollLastEntry()
  {
    synchronized (mutex)
    {
      Map.Entry localEntry = Synchronized.access$700(delegate().pollLastEntry(), mutex);
      return localEntry;
    }
  }
  
  public NavigableMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    synchronized (mutex)
    {
      paramK1 = Synchronized.navigableMap(delegate().subMap(paramK1, paramBoolean1, paramK2, paramBoolean2), mutex);
      return paramK1;
    }
  }
  
  public SortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }
  
  public NavigableMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.navigableMap(delegate().tailMap(paramK, paramBoolean), mutex);
      return paramK;
    }
  }
  
  public SortedMap<K, V> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedNavigableMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */