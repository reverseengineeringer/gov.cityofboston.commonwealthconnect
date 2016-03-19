package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;

class MapConstraints$ConstrainedEntries<K, V>
  extends ForwardingCollection<Map.Entry<K, V>>
{
  final MapConstraint<? super K, ? super V> constraint;
  final Collection<Map.Entry<K, V>> entries;
  
  MapConstraints$ConstrainedEntries(Collection<Map.Entry<K, V>> paramCollection, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    entries = paramCollection;
    constraint = paramMapConstraint;
  }
  
  public boolean contains(Object paramObject)
  {
    return Maps.containsEntryImpl(delegate(), paramObject);
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return standardContainsAll(paramCollection);
  }
  
  protected Collection<Map.Entry<K, V>> delegate()
  {
    return entries;
  }
  
  public Iterator<Map.Entry<K, V>> iterator()
  {
    new ForwardingIterator()
    {
      protected Iterator<Map.Entry<K, V>> delegate()
      {
        return val$iterator;
      }
      
      public Map.Entry<K, V> next()
      {
        return MapConstraints.access$500((Map.Entry)val$iterator.next(), constraint);
      }
    };
  }
  
  public boolean remove(Object paramObject)
  {
    return Maps.removeEntryImpl(delegate(), paramObject);
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
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedEntries
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */