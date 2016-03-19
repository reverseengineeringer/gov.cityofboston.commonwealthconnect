package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Synchronized$SynchronizedAsMapEntries<K, V>
  extends Synchronized.SynchronizedSet<Map.Entry<K, Collection<V>>>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedAsMapEntries(Set<Map.Entry<K, Collection<V>>> paramSet, @Nullable Object paramObject)
  {
    super(paramSet, paramObject);
  }
  
  public boolean contains(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = Maps.containsEntryImpl(delegate(), paramObject);
      return bool;
    }
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    synchronized (mutex)
    {
      boolean bool = Collections2.containsAllImpl(delegate(), paramCollection);
      return bool;
    }
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    synchronized (mutex)
    {
      boolean bool = Sets.equalsImpl(delegate(), paramObject);
      return bool;
    }
  }
  
  public Iterator<Map.Entry<K, Collection<V>>> iterator()
  {
    new ForwardingIterator()
    {
      protected Iterator<Map.Entry<K, Collection<V>>> delegate()
      {
        return val$iterator;
      }
      
      public Map.Entry<K, Collection<V>> next()
      {
        new ForwardingMapEntry()
        {
          protected Map.Entry<K, Collection<V>> delegate()
          {
            return val$entry;
          }
          
          public Collection<V> getValue()
          {
            return Synchronized.access$400((Collection)val$entry.getValue(), mutex);
          }
        };
      }
    };
  }
  
  public boolean remove(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = Maps.removeEntryImpl(delegate(), paramObject);
      return bool;
    }
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    synchronized (mutex)
    {
      boolean bool = Iterators.removeAll(delegate().iterator(), paramCollection);
      return bool;
    }
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    synchronized (mutex)
    {
      boolean bool = Iterators.retainAll(delegate().iterator(), paramCollection);
      return bool;
    }
  }
  
  public Object[] toArray()
  {
    synchronized (mutex)
    {
      Object[] arrayOfObject = ObjectArrays.toArrayImpl(delegate());
      return arrayOfObject;
    }
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    synchronized (mutex)
    {
      paramArrayOfT = ObjectArrays.toArrayImpl(delegate(), paramArrayOfT);
      return paramArrayOfT;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedAsMapEntries
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */