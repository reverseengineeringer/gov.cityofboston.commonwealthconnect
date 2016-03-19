package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible
final class FilteredMultimapValues<K, V>
  extends AbstractCollection<V>
{
  private final FilteredMultimap<K, V> multimap;
  
  FilteredMultimapValues(FilteredMultimap<K, V> paramFilteredMultimap)
  {
    multimap = ((FilteredMultimap)Preconditions.checkNotNull(paramFilteredMultimap));
  }
  
  public void clear()
  {
    multimap.clear();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return multimap.containsValue(paramObject);
  }
  
  public Iterator<V> iterator()
  {
    return Maps.valueIterator(multimap.entries().iterator());
  }
  
  public boolean remove(@Nullable Object paramObject)
  {
    Predicate localPredicate = multimap.entryPredicate();
    Iterator localIterator = multimap.unfiltered().entries().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if ((localPredicate.apply(localEntry)) && (Objects.equal(localEntry.getValue(), paramObject)))
      {
        localIterator.remove();
        return true;
      }
    }
    return false;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    return Iterables.removeIf(multimap.unfiltered().entries(), Predicates.and(multimap.entryPredicate(), Maps.valuePredicateOnEntries(Predicates.in(paramCollection))));
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return Iterables.removeIf(multimap.unfiltered().entries(), Predicates.and(multimap.entryPredicate(), Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramCollection)))));
  }
  
  public int size()
  {
    return multimap.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredMultimapValues
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */