package com.google.common.collect;

import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Synchronized$SynchronizedSetMultimap<K, V>
  extends Synchronized.SynchronizedMultimap<K, V>
  implements SetMultimap<K, V>
{
  private static final long serialVersionUID = 0L;
  transient Set<Map.Entry<K, V>> entrySet;
  
  Synchronized$SynchronizedSetMultimap(SetMultimap<K, V> paramSetMultimap, @Nullable Object paramObject)
  {
    super(paramSetMultimap, paramObject);
  }
  
  SetMultimap<K, V> delegate()
  {
    return (SetMultimap)super.delegate();
  }
  
  public Set<Map.Entry<K, V>> entries()
  {
    synchronized (mutex)
    {
      if (entrySet == null) {
        entrySet = Synchronized.set(delegate().entries(), mutex);
      }
      Set localSet = entrySet;
      return localSet;
    }
  }
  
  public Set<V> get(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.set(delegate().get(paramK), mutex);
      return paramK;
    }
  }
  
  public Set<V> removeAll(Object paramObject)
  {
    synchronized (mutex)
    {
      paramObject = delegate().removeAll(paramObject);
      return (Set<V>)paramObject;
    }
  }
  
  public Set<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    synchronized (mutex)
    {
      paramK = delegate().replaceValues(paramK, paramIterable);
      return paramK;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */