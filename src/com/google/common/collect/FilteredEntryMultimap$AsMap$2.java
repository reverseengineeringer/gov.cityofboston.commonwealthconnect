package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class FilteredEntryMultimap$AsMap$2
  extends Maps.EntrySet<K, Collection<V>>
{
  FilteredEntryMultimap$AsMap$2(FilteredEntryMultimap.AsMap paramAsMap) {}
  
  public Iterator<Map.Entry<K, Collection<V>>> iterator()
  {
    new AbstractIterator()
    {
      final Iterator<Map.Entry<K, Collection<V>>> backingIterator = this$1this$0.unfiltered.asMap().entrySet().iterator();
      
      protected Map.Entry<K, Collection<V>> computeNext()
      {
        while (backingIterator.hasNext())
        {
          Object localObject2 = (Map.Entry)backingIterator.next();
          Object localObject1 = ((Map.Entry)localObject2).getKey();
          localObject2 = FilteredEntryMultimap.filterCollection((Collection)((Map.Entry)localObject2).getValue(), new FilteredEntryMultimap.ValuePredicate(this$1.this$0, localObject1));
          if (!((Collection)localObject2).isEmpty()) {
            return Maps.immutableEntry(localObject1, localObject2);
          }
        }
        return (Map.Entry)endOfData();
      }
    };
  }
  
  Map<K, Collection<V>> map()
  {
    return this$1;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return this$1.this$0.removeEntriesIf(Predicates.in(paramCollection));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return this$1.this$0.removeEntriesIf(Predicates.not(Predicates.in(paramCollection)));
  }
  
  public int size()
  {
    return Iterators.size(iterator());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.AsMap.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */