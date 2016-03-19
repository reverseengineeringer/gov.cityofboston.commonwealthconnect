package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class FilteredEntryMultimap$AsMap$2$1
  extends AbstractIterator<Map.Entry<K, Collection<V>>>
{
  final Iterator<Map.Entry<K, Collection<V>>> backingIterator = this$2.this$1.this$0.unfiltered.asMap().entrySet().iterator();
  
  FilteredEntryMultimap$AsMap$2$1(FilteredEntryMultimap.AsMap.2 param2) {}
  
  protected Map.Entry<K, Collection<V>> computeNext()
  {
    while (backingIterator.hasNext())
    {
      Object localObject2 = (Map.Entry)backingIterator.next();
      Object localObject1 = ((Map.Entry)localObject2).getKey();
      localObject2 = FilteredEntryMultimap.filterCollection((Collection)((Map.Entry)localObject2).getValue(), new FilteredEntryMultimap.ValuePredicate(this$2.this$1.this$0, localObject1));
      if (!((Collection)localObject2).isEmpty()) {
        return Maps.immutableEntry(localObject1, localObject2);
      }
    }
    return (Map.Entry)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.AsMap.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */