package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class MapConstraints$ConstrainedAsMapEntries<K, V>
  extends ForwardingSet<Map.Entry<K, Collection<V>>>
{
  private final MapConstraint<? super K, ? super V> constraint;
  private final Set<Map.Entry<K, Collection<V>>> entries;
  
  MapConstraints$ConstrainedAsMapEntries(Set<Map.Entry<K, Collection<V>>> paramSet, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    entries = paramSet;
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
  
  protected Set<Map.Entry<K, Collection<V>>> delegate()
  {
    return entries;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return standardEquals(paramObject);
  }
  
  public int hashCode()
  {
    return standardHashCode();
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
        return MapConstraints.access$700((Map.Entry)val$iterator.next(), constraint);
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
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedAsMapEntries
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */