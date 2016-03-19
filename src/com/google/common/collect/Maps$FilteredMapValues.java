package com.google.common.collect;

import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;
import java.util.Map.Entry;

final class Maps$FilteredMapValues<K, V>
  extends Maps.Values<K, V>
{
  Predicate<? super Map.Entry<K, V>> predicate;
  Map<K, V> unfiltered;
  
  Maps$FilteredMapValues(Map<K, V> paramMap1, Map<K, V> paramMap2, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    super(paramMap1);
    unfiltered = paramMap2;
    predicate = paramPredicate;
  }
  
  private boolean removeIf(Predicate<? super V> paramPredicate)
  {
    return Iterables.removeIf(unfiltered.entrySet(), Predicates.and(predicate, Maps.valuePredicateOnEntries(paramPredicate)));
  }
  
  public boolean remove(Object paramObject)
  {
    return Iterables.removeFirstMatching(unfiltered.entrySet(), Predicates.and(predicate, Maps.valuePredicateOnEntries(Predicates.equalTo(paramObject)))) != null;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return removeIf(Predicates.in(paramCollection));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return removeIf(Predicates.not(Predicates.in(paramCollection)));
  }
  
  public Object[] toArray()
  {
    return Lists.newArrayList(iterator()).toArray();
  }
  
  public <T> T[] toArray(T[] paramArrayOfT)
  {
    return Lists.newArrayList(iterator()).toArray(paramArrayOfT);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredMapValues
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */