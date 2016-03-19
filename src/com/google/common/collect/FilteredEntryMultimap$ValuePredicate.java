package com.google.common.collect;

import com.google.common.base.Predicate;
import javax.annotation.Nullable;

final class FilteredEntryMultimap$ValuePredicate
  implements Predicate<V>
{
  private final K key;
  
  FilteredEntryMultimap$ValuePredicate(K paramK)
  {
    Object localObject;
    key = localObject;
  }
  
  public boolean apply(@Nullable V paramV)
  {
    return FilteredEntryMultimap.access$000(this$0, key, paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.ValuePredicate
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */