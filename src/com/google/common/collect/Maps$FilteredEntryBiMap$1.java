package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Map.Entry;

final class Maps$FilteredEntryBiMap$1
  implements Predicate<Map.Entry<V, K>>
{
  Maps$FilteredEntryBiMap$1(Predicate paramPredicate) {}
  
  public boolean apply(Map.Entry<V, K> paramEntry)
  {
    return val$forwardPredicate.apply(Maps.immutableEntry(paramEntry.getValue(), paramEntry.getKey()));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryBiMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */