package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtIncompatible("works but is needed only for NavigableMap")
class Synchronized$SynchronizedEntry<K, V>
  extends Synchronized.SynchronizedObject
  implements Map.Entry<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedEntry(Map.Entry<K, V> paramEntry, @Nullable Object paramObject)
  {
    super(paramEntry, paramObject);
  }
  
  Map.Entry<K, V> delegate()
  {
    return (Map.Entry)super.delegate();
  }
  
  public boolean equals(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().equals(paramObject);
      return bool;
    }
  }
  
  public K getKey()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().getKey();
      return (K)localObject2;
    }
  }
  
  public V getValue()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().getValue();
      return (V)localObject2;
    }
  }
  
  public int hashCode()
  {
    synchronized (mutex)
    {
      int i = delegate().hashCode();
      return i;
    }
  }
  
  public V setValue(V paramV)
  {
    synchronized (mutex)
    {
      paramV = delegate().setValue(paramV);
      return paramV;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */