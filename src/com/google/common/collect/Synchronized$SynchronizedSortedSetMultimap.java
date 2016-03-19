package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;
import javax.annotation.Nullable;

class Synchronized$SynchronizedSortedSetMultimap<K, V>
  extends Synchronized.SynchronizedSetMultimap<K, V>
  implements SortedSetMultimap<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedSortedSetMultimap(SortedSetMultimap<K, V> paramSortedSetMultimap, @Nullable Object paramObject)
  {
    super(paramSortedSetMultimap, paramObject);
  }
  
  SortedSetMultimap<K, V> delegate()
  {
    return (SortedSetMultimap)super.delegate();
  }
  
  public SortedSet<V> get(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$100(delegate().get(paramK), mutex);
      return paramK;
    }
  }
  
  public SortedSet<V> removeAll(Object paramObject)
  {
    synchronized (mutex)
    {
      paramObject = delegate().removeAll(paramObject);
      return (SortedSet<V>)paramObject;
    }
  }
  
  public SortedSet<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    synchronized (mutex)
    {
      paramK = delegate().replaceValues(paramK, paramIterable);
      return paramK;
    }
  }
  
  public Comparator<? super V> valueComparator()
  {
    synchronized (mutex)
    {
      Comparator localComparator = delegate().valueComparator();
      return localComparator;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedSortedSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */