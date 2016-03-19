package com.google.common.collect;

import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class FilteredEntryMultimap$Keys
  extends Multimaps.Keys<K, V>
{
  FilteredEntryMultimap$Keys(FilteredEntryMultimap paramFilteredEntryMultimap)
  {
    super(paramFilteredEntryMultimap);
  }
  
  public Set<Multiset.Entry<K>> entrySet()
  {
    new Multisets.EntrySet()
    {
      private boolean removeEntriesIf(final Predicate<? super Multiset.Entry<K>> paramAnonymousPredicate)
      {
        this$0.removeEntriesIf(new Predicate()
        {
          public boolean apply(Map.Entry<K, Collection<V>> paramAnonymous2Entry)
          {
            return paramAnonymousPredicate.apply(Multisets.immutableEntry(paramAnonymous2Entry.getKey(), ((Collection)paramAnonymous2Entry.getValue()).size()));
          }
        });
      }
      
      public Iterator<Multiset.Entry<K>> iterator()
      {
        return entryIterator();
      }
      
      Multiset<K> multiset()
      {
        return FilteredEntryMultimap.Keys.this;
      }
      
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return removeEntriesIf(Predicates.in(paramAnonymousCollection));
      }
      
      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return removeEntriesIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
      }
      
      public int size()
      {
        return this$0.keySet().size();
      }
    };
  }
  
  public int remove(@Nullable Object paramObject, int paramInt)
  {
    CollectPreconditions.checkNonnegative(paramInt, "occurrences");
    int j;
    if (paramInt == 0)
    {
      j = count(paramObject);
      return j;
    }
    Object localObject1 = (Collection)this$0.unfiltered.asMap().get(paramObject);
    if (localObject1 == null) {
      return 0;
    }
    int i = 0;
    localObject1 = ((Collection)localObject1).iterator();
    for (;;)
    {
      j = i;
      if (!((Iterator)localObject1).hasNext()) {
        break;
      }
      Object localObject2 = ((Iterator)localObject1).next();
      if (FilteredEntryMultimap.access$000(this$0, paramObject, localObject2))
      {
        j = i + 1;
        i = j;
        if (j <= paramInt)
        {
          ((Iterator)localObject1).remove();
          i = j;
        }
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.Keys
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */