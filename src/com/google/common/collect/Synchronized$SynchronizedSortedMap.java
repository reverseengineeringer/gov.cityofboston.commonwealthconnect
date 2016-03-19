package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedMap;
import javax.annotation.Nullable;

class Synchronized$SynchronizedSortedMap<K, V>
  extends Synchronized.SynchronizedMap<K, V>
  implements SortedMap<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedSortedMap(SortedMap<K, V> paramSortedMap, @Nullable Object paramObject)
  {
    super(paramSortedMap, paramObject);
  }
  
  public Comparator<? super K> comparator()
  {
    synchronized (mutex)
    {
      Comparator localComparator = delegate().comparator();
      return localComparator;
    }
  }
  
  SortedMap<K, V> delegate()
  {
    return (SortedMap)super.delegate();
  }
  
  public K firstKey()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().firstKey();
      return (K)localObject2;
    }
  }
  
  public SortedMap<K, V> headMap(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.sortedMap(delegate().headMap(paramK), mutex);
      return paramK;
    }
  }
  
  public K lastKey()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().lastKey();
      return (K)localObject2;
    }
  }
  
  public SortedMap<K, V> subMap(K paramK1, K paramK2)
  {
    synchronized (mutex)
    {
      paramK1 = Synchronized.sortedMap(delegate().subMap(paramK1, paramK2), mutex);
      return paramK1;
    }
  }
  
  public SortedMap<K, V> tailMap(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.sortedMap(delegate().tailMap(paramK), mutex);
      return paramK;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */