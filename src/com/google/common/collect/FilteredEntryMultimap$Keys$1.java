package com.google.common.collect;

import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

class FilteredEntryMultimap$Keys$1
  extends Multisets.EntrySet<K>
{
  FilteredEntryMultimap$Keys$1(FilteredEntryMultimap.Keys paramKeys) {}
  
  private boolean removeEntriesIf(final Predicate<? super Multiset.Entry<K>> paramPredicate)
  {
    this$1.this$0.removeEntriesIf(new Predicate()
    {
      public boolean apply(Map.Entry<K, Collection<V>> paramAnonymousEntry)
      {
        return paramPredicate.apply(Multisets.immutableEntry(paramAnonymousEntry.getKey(), ((Collection)paramAnonymousEntry.getValue()).size()));
      }
    });
  }
  
  public Iterator<Multiset.Entry<K>> iterator()
  {
    return this$1.entryIterator();
  }
  
  Multiset<K> multiset()
  {
    return this$1;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return removeEntriesIf(Predicates.in(paramCollection));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return removeEntriesIf(Predicates.not(Predicates.in(paramCollection)));
  }
  
  public int size()
  {
    return this$1.this$0.keySet().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.Keys.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */