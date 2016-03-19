package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Map;
import javax.annotation.Nullable;

class FilteredEntryMultimap$AsMap$1
  extends Maps.KeySet<K, Collection<V>>
{
  FilteredEntryMultimap$AsMap$1(FilteredEntryMultimap.AsMap paramAsMap, Map paramMap)
  {
    super(paramMap);
  }
  
  public boolean remove(@Nullable Object paramObject)
  {
    return this$1.remove(paramObject) != null;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return this$1.this$0.removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.in(paramCollection)));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return this$1.this$0.removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramCollection))));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.AsMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */