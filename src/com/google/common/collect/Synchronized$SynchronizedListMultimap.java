package com.google.common.collect;

import java.util.List;
import javax.annotation.Nullable;

class Synchronized$SynchronizedListMultimap<K, V>
  extends Synchronized.SynchronizedMultimap<K, V>
  implements ListMultimap<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedListMultimap(ListMultimap<K, V> paramListMultimap, @Nullable Object paramObject)
  {
    super(paramListMultimap, paramObject);
  }
  
  ListMultimap<K, V> delegate()
  {
    return (ListMultimap)super.delegate();
  }
  
  public List<V> get(K paramK)
  {
    synchronized (mutex)
    {
      paramK = Synchronized.access$200(delegate().get(paramK), mutex);
      return paramK;
    }
  }
  
  public List<V> removeAll(Object paramObject)
  {
    synchronized (mutex)
    {
      paramObject = delegate().removeAll(paramObject);
      return (List<V>)paramObject;
    }
  }
  
  public List<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    synchronized (mutex)
    {
      paramK = delegate().replaceValues(paramK, paramIterable);
      return paramK;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedListMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */