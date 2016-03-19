package com.google.common.collect;

import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

class Maps$FilteredEntryMap$KeySet
  extends Maps.KeySet<K, V>
{
  Maps$FilteredEntryMap$KeySet(Maps.FilteredEntryMap paramFilteredEntryMap)
  {
    super(paramFilteredEntryMap);
  }
  
  private boolean removeIf(Predicate<? super K> paramPredicate)
  {
    return Iterables.removeIf(this$0.unfiltered.entrySet(), Predicates.and(this$0.predicate, Maps.keyPredicateOnEntries(paramPredicate)));
  }
  
  public boolean remove(Object paramObject)
  {
    if (this$0.containsKey(paramObject))
    {
      this$0.unfiltered.remove(paramObject);
      return true;
    }
    return false;
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
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryMap.KeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */