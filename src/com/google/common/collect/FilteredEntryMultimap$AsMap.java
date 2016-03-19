package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class FilteredEntryMultimap$AsMap
  extends Maps.ImprovedAbstractMap<K, Collection<V>>
{
  FilteredEntryMultimap$AsMap(FilteredEntryMultimap paramFilteredEntryMultimap) {}
  
  public void clear()
  {
    this$0.clear();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return get(paramObject) != null;
  }
  
  Set<Map.Entry<K, Collection<V>>> createEntrySet()
  {
    new Maps.EntrySet()
    {
      public Iterator<Map.Entry<K, Collection<V>>> iterator()
      {
        new AbstractIterator()
        {
          final Iterator<Map.Entry<K, Collection<V>>> backingIterator = this$0.unfiltered.asMap().entrySet().iterator();
          
          protected Map.Entry<K, Collection<V>> computeNext()
          {
            while (backingIterator.hasNext())
            {
              Object localObject2 = (Map.Entry)backingIterator.next();
              Object localObject1 = ((Map.Entry)localObject2).getKey();
              localObject2 = FilteredEntryMultimap.filterCollection((Collection)((Map.Entry)localObject2).getValue(), new FilteredEntryMultimap.ValuePredicate(this$0, localObject1));
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
        return FilteredEntryMultimap.AsMap.this;
      }
      
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return this$0.removeEntriesIf(Predicates.in(paramAnonymousCollection));
      }
      
      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return this$0.removeEntriesIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
      }
      
      public int size()
      {
        return Iterators.size(iterator());
      }
    };
  }
  
  Set<K> createKeySet()
  {
    new Maps.KeySet(this)
    {
      public boolean remove(@Nullable Object paramAnonymousObject)
      {
        return remove(paramAnonymousObject) != null;
      }
      
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return this$0.removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.in(paramAnonymousCollection)));
      }
      
      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return this$0.removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection))));
      }
    };
  }
  
  Collection<Collection<V>> createValues()
  {
    new Maps.Values(this)
    {
      public boolean remove(@Nullable Object paramAnonymousObject)
      {
        if ((paramAnonymousObject instanceof Collection))
        {
          paramAnonymousObject = (Collection)paramAnonymousObject;
          Iterator localIterator = this$0.unfiltered.asMap().entrySet().iterator();
          while (localIterator.hasNext())
          {
            Map.Entry localEntry = (Map.Entry)localIterator.next();
            Object localObject = localEntry.getKey();
            localObject = FilteredEntryMultimap.filterCollection((Collection)localEntry.getValue(), new FilteredEntryMultimap.ValuePredicate(this$0, localObject));
            if ((!((Collection)localObject).isEmpty()) && (((Collection)paramAnonymousObject).equals(localObject)))
            {
              if (((Collection)localObject).size() == ((Collection)localEntry.getValue()).size()) {
                localIterator.remove();
              }
              for (;;)
              {
                return true;
                ((Collection)localObject).clear();
              }
            }
          }
        }
        return false;
      }
      
      public boolean removeAll(Collection<?> paramAnonymousCollection)
      {
        return this$0.removeEntriesIf(Maps.valuePredicateOnEntries(Predicates.in(paramAnonymousCollection)));
      }
      
      public boolean retainAll(Collection<?> paramAnonymousCollection)
      {
        return this$0.removeEntriesIf(Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection))));
      }
    };
  }
  
  public Collection<V> get(@Nullable Object paramObject)
  {
    Collection localCollection = (Collection)this$0.unfiltered.asMap().get(paramObject);
    if (localCollection == null) {}
    do
    {
      return null;
      paramObject = FilteredEntryMultimap.filterCollection(localCollection, new FilteredEntryMultimap.ValuePredicate(this$0, paramObject));
    } while (((Collection)paramObject).isEmpty());
    return (Collection<V>)paramObject;
  }
  
  public Collection<V> remove(@Nullable Object paramObject)
  {
    Object localObject1 = (Collection)this$0.unfiltered.asMap().get(paramObject);
    if (localObject1 == null) {}
    ArrayList localArrayList;
    do
    {
      return null;
      localArrayList = Lists.newArrayList();
      localObject1 = ((Collection)localObject1).iterator();
      while (((Iterator)localObject1).hasNext())
      {
        Object localObject2 = ((Iterator)localObject1).next();
        if (FilteredEntryMultimap.access$000(this$0, paramObject, localObject2))
        {
          ((Iterator)localObject1).remove();
          localArrayList.add(localObject2);
        }
      }
    } while (localArrayList.isEmpty());
    if ((this$0.unfiltered instanceof SetMultimap)) {
      return Collections.unmodifiableSet(Sets.newLinkedHashSet(localArrayList));
    }
    return Collections.unmodifiableList(localArrayList);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap.AsMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */