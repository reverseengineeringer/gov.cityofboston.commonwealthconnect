package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class Maps$FilteredKeyMap<K, V>
  extends Maps.AbstractFilteredMap<K, V>
{
  Predicate<? super K> keyPredicate;
  
  Maps$FilteredKeyMap(Map<K, V> paramMap, Predicate<? super K> paramPredicate, Predicate<? super Map.Entry<K, V>> paramPredicate1)
  {
    super(paramMap, paramPredicate1);
    keyPredicate = paramPredicate;
  }
  
  public boolean containsKey(Object paramObject)
  {
    return (unfiltered.containsKey(paramObject)) && (keyPredicate.apply(paramObject));
  }
  
  protected Set<Map.Entry<K, V>> createEntrySet()
  {
    return Sets.filter(unfiltered.entrySet(), predicate);
  }
  
  Set<K> createKeySet()
  {
    return Sets.filter(unfiltered.keySet(), keyPredicate);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredKeyMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */