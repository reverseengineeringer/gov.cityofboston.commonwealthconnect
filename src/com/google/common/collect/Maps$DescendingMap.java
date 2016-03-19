package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NavigableSet;
import java.util.Set;
import java.util.SortedMap;

@GwtIncompatible("NavigableMap")
abstract class Maps$DescendingMap<K, V>
  extends ForwardingMap<K, V>
  implements NavigableMap<K, V>
{
  private transient Comparator<? super K> comparator;
  private transient Set<Map.Entry<K, V>> entrySet;
  private transient NavigableSet<K> navigableKeySet;
  
  private static <T> Ordering<T> reverse(Comparator<T> paramComparator)
  {
    return Ordering.from(paramComparator).reverse();
  }
  
  public Map.Entry<K, V> ceilingEntry(K paramK)
  {
    return forward().floorEntry(paramK);
  }
  
  public K ceilingKey(K paramK)
  {
    return (K)forward().floorKey(paramK);
  }
  
  public Comparator<? super K> comparator()
  {
    Comparator localComparator = comparator;
    Object localObject = localComparator;
    if (localComparator == null)
    {
      localComparator = forward().comparator();
      localObject = localComparator;
      if (localComparator == null) {
        localObject = Ordering.natural();
      }
      localObject = reverse((Comparator)localObject);
      comparator = ((Comparator)localObject);
    }
    return (Comparator<? super K>)localObject;
  }
  
  Set<Map.Entry<K, V>> createEntrySet()
  {
    new Maps.EntrySet()
    {
      public Iterator<Map.Entry<K, V>> iterator()
      {
        return entryIterator();
      }
      
      Map<K, V> map()
      {
        return Maps.DescendingMap.this;
      }
    };
  }
  
  protected final Map<K, V> delegate()
  {
    return forward();
  }
  
  public NavigableSet<K> descendingKeySet()
  {
    return forward().navigableKeySet();
  }
  
  public NavigableMap<K, V> descendingMap()
  {
    return forward();
  }
  
  abstract Iterator<Map.Entry<K, V>> entryIterator();
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    Set localSet2 = entrySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = createEntrySet();
      entrySet = localSet1;
    }
    return localSet1;
  }
  
  public Map.Entry<K, V> firstEntry()
  {
    return forward().lastEntry();
  }
  
  public K firstKey()
  {
    return (K)forward().lastKey();
  }
  
  public Map.Entry<K, V> floorEntry(K paramK)
  {
    return forward().ceilingEntry(paramK);
  }
  
  public K floorKey(K paramK)
  {
    return (K)forward().ceilingKey(paramK);
  }
  
  abstract NavigableMap<K, V> forward();
  
  public NavigableMap<K, V> headMap(K paramK, boolean paramBoolean)
  {
    return forward().tailMap(paramK, paramBoolean).descendingMap();
  }
  
  public SortedMap<K, V> headMap(K paramK)
  {
    return headMap(paramK, false);
  }
  
  public Map.Entry<K, V> higherEntry(K paramK)
  {
    return forward().lowerEntry(paramK);
  }
  
  public K higherKey(K paramK)
  {
    return (K)forward().lowerKey(paramK);
  }
  
  public Set<K> keySet()
  {
    return navigableKeySet();
  }
  
  public Map.Entry<K, V> lastEntry()
  {
    return forward().firstEntry();
  }
  
  public K lastKey()
  {
    return (K)forward().firstKey();
  }
  
  public Map.Entry<K, V> lowerEntry(K paramK)
  {
    return forward().higherEntry(paramK);
  }
  
  public K lowerKey(K paramK)
  {
    return (K)forward().higherKey(paramK);
  }
  
  public NavigableSet<K> navigableKeySet()
  {
    NavigableSet localNavigableSet = navigableKeySet;
    Object localObject = localNavigableSet;
    if (localNavigableSet == null)
    {
      localObject = new Maps.NavigableKeySet(this);
      navigableKeySet = ((NavigableSet)localObject);
    }
    return (NavigableSet<K>)localObject;
  }
  
  public Map.Entry<K, V> pollFirstEntry()
  {
    return forward().pollLastEntry();
  }
  
  public Map.Entry<K, V> pollLastEntry()
  {
    return forward().pollFirstEntry();
  }
  
  public NavigableMap<K, V> subMap(K paramK1, boolean paramBoolean1, K paramK2, boolean paramBoolean2)
  {
    return forward().subMap(paramK2, paramBoolean2, paramK1, paramBoolean1).descendingMap();
  }
  
  public SortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    return subMap(paramK1, true, paramK2, false);
  }
  
  public NavigableMap<K, V> tailMap(K paramK, boolean paramBoolean)
  {
    return forward().headMap(paramK, paramBoolean).descendingMap();
  }
  
  public SortedMap<K, V> tailMap(K paramK)
  {
    return tailMap(paramK, true);
  }
  
  public String toString()
  {
    return standardToString();
  }
  
  public Collection<V> values()
  {
    return new Maps.Values(this);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.DescendingMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */