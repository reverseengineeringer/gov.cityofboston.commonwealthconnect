package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

class MapConstraints$ConstrainedAsMapValues<K, V>
  extends ForwardingCollection<Collection<V>>
{
  final Collection<Collection<V>> delegate;
  final Set<Map.Entry<K, Collection<V>>> entrySet;
  
  MapConstraints$ConstrainedAsMapValues(Collection<Collection<V>> paramCollection, Set<Map.Entry<K, Collection<V>>> paramSet)
  {
    delegate = paramCollection;
    entrySet = paramSet;
  }
  
  public boolean contains(Object paramObject)
  {
    return standardContains(paramObject);
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return standardContainsAll(paramCollection);
  }
  
  protected Collection<Collection<V>> delegate()
  {
    return delegate;
  }
  
  public Iterator<Collection<V>> iterator()
  {
    new Iterator()
    {
      public boolean hasNext()
      {
        return val$iterator.hasNext();
      }
      
      public Collection<V> next()
      {
        return (Collection)((Map.Entry)val$iterator.next()).getValue();
      }
      
      public void remove()
      {
        val$iterator.remove();
      }
    };
  }
  
  public boolean remove(Object paramObject)
  {
    return standardRemove(paramObject);
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return standardRemoveAll(paramCollection);
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return standardRetainAll(paramCollection);
  }
  
  public Object[] toArray()
  {
    return standardToArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return standardToArray(paramArrayOfT);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedAsMapValues
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */