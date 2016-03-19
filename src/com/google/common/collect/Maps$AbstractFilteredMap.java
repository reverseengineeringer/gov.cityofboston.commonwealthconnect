package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

abstract class Maps$AbstractFilteredMap<K, V>
  extends Maps.ImprovedAbstractMap<K, V>
{
  final Predicate<? super Map.Entry<K, V>> predicate;
  final Map<K, V> unfiltered;
  
  Maps$AbstractFilteredMap(Map<K, V> paramMap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    unfiltered = paramMap;
    predicate = paramPredicate;
  }
  
  boolean apply(@Nullable Object paramObject, @Nullable V paramV)
  {
    return predicate.apply(Maps.immutableEntry(paramObject, paramV));
  }
  
  public boolean containsKey(Object paramObject)
  {
    return (unfiltered.containsKey(paramObject)) && (apply(paramObject, unfiltered.get(paramObject)));
  }
  
  Collection<V> createValues()
  {
    return new Maps.FilteredMapValues(this, unfiltered, predicate);
  }
  
  public V get(Object paramObject)
  {
    Object localObject = unfiltered.get(paramObject);
    if ((localObject != null) && (apply(paramObject, localObject))) {
      return (V)localObject;
    }
    return null;
  }
  
  public boolean isEmpty()
  {
    return entrySet().isEmpty();
  }
  
  public V put(K paramK, V paramV)
  {
    Preconditions.checkArgument(apply(paramK, paramV));
    return (V)unfiltered.put(paramK, paramV);
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    Iterator localIterator = paramMap.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Preconditions.checkArgument(apply(localEntry.getKey(), localEntry.getValue()));
    }
    unfiltered.putAll(paramMap);
  }
  
  public V remove(Object paramObject)
  {
    if (containsKey(paramObject)) {
      return (V)unfiltered.remove(paramObject);
    }
    return null;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.AbstractFilteredMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */