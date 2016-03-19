package com.google.common.collect;

import com.google.common.base.Predicate;
import java.util.Collection;
import java.util.Map.Entry;
import javax.annotation.Nullable;

class FilteredKeyMultimap$Entries
  extends ForwardingCollection<Map.Entry<K, V>>
{
  FilteredKeyMultimap$Entries(FilteredKeyMultimap paramFilteredKeyMultimap) {}
  
  protected Collection<Map.Entry<K, V>> delegate()
  {
    return Collections2.filter(this$0.unfiltered.entries(), this$0.entryPredicate());
  }
  
  public boolean remove(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      if ((this$0.unfiltered.containsKey(((Map.Entry)paramObject).getKey())) && (this$0.keyPredicate.apply(((Map.Entry)paramObject).getKey()))) {
        return this$0.unfiltered.remove(((Map.Entry)paramObject).getKey(), ((Map.Entry)paramObject).getValue());
      }
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredKeyMultimap.Entries
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */