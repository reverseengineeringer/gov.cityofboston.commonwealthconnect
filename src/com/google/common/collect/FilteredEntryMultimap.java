package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
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

@GwtCompatible
class FilteredEntryMultimap<K, V>
  extends AbstractMultimap<K, V>
  implements FilteredMultimap<K, V>
{
  final Predicate<? super Map.Entry<K, V>> predicate;
  final Multimap<K, V> unfiltered;
  
  FilteredEntryMultimap(Multimap<K, V> paramMultimap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    unfiltered = ((Multimap)Preconditions.checkNotNull(paramMultimap));
    predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  static <E> Collection<E> filterCollection(Collection<E> paramCollection, Predicate<? super E> paramPredicate)
  {
    if ((paramCollection instanceof Set)) {
      return Sets.filter((Set)paramCollection, paramPredicate);
    }
    return Collections2.filter(paramCollection, paramPredicate);
  }
  
  private boolean satisfies(K paramK, V paramV)
  {
    return predicate.apply(Maps.immutableEntry(paramK, paramV));
  }
  
  public void clear()
  {
    entries().clear();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return asMap().get(paramObject) != null;
  }
  
  Map<K, Collection<V>> createAsMap()
  {
    return new AsMap();
  }
  
  Collection<Map.Entry<K, V>> createEntries()
  {
    return filterCollection(unfiltered.entries(), predicate);
  }
  
  Multiset<K> createKeys()
  {
    return new Keys();
  }
  
  Collection<V> createValues()
  {
    return new FilteredMultimapValues(this);
  }
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    throw new AssertionError("should never be called");
  }
  
  public Predicate<? super Map.Entry<K, V>> entryPredicate()
  {
    return predicate;
  }
  
  public Collection<V> get(K paramK)
  {
    return filterCollection(unfiltered.get(paramK), new ValuePredicate(paramK));
  }
  
  public Set<K> keySet()
  {
    return asMap().keySet();
  }
  
  public Collection<V> removeAll(@Nullable Object paramObject)
  {
    return (Collection)Objects.firstNonNull(asMap().remove(paramObject), unmodifiableEmptyCollection());
  }
  
  boolean removeEntriesIf(Predicate<? super Map.Entry<K, Collection<V>>> paramPredicate)
  {
    Iterator localIterator = unfiltered.asMap().entrySet().iterator();
    boolean bool = false;
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject = localEntry.getKey();
      Collection localCollection = filterCollection((Collection)localEntry.getValue(), new ValuePredicate(localObject));
      if ((!localCollection.isEmpty()) && (paramPredicate.apply(Maps.immutableEntry(localObject, localCollection))))
      {
        if (localCollection.size() == ((Collection)localEntry.getValue()).size()) {
          localIterator.remove();
        }
        for (;;)
        {
          bool = true;
          break;
          localCollection.clear();
        }
      }
    }
    return bool;
  }
  
  public int size()
  {
    return entries().size();
  }
  
  public Multimap<K, V> unfiltered()
  {
    return unfiltered;
  }
  
  Collection<V> unmodifiableEmptyCollection()
  {
    if ((unfiltered instanceof SetMultimap)) {
      return Collections.emptySet();
    }
    return Collections.emptyList();
  }
  
  class AsMap
    extends Maps.ImprovedAbstractMap<K, Collection<V>>
  {
    AsMap() {}
    
    public void clear()
    {
      FilteredEntryMultimap.this.clear();
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
            final Iterator<Map.Entry<K, Collection<V>>> backingIterator = unfiltered.asMap().entrySet().iterator();
            
            protected Map.Entry<K, Collection<V>> computeNext()
            {
              while (backingIterator.hasNext())
              {
                Object localObject2 = (Map.Entry)backingIterator.next();
                Object localObject1 = ((Map.Entry)localObject2).getKey();
                localObject2 = FilteredEntryMultimap.filterCollection((Collection)((Map.Entry)localObject2).getValue(), new FilteredEntryMultimap.ValuePredicate(FilteredEntryMultimap.this, localObject1));
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
          return removeEntriesIf(Predicates.in(paramAnonymousCollection));
        }
        
        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return removeEntriesIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
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
          return removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.in(paramAnonymousCollection)));
        }
        
        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection))));
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
            Iterator localIterator = unfiltered.asMap().entrySet().iterator();
            while (localIterator.hasNext())
            {
              Map.Entry localEntry = (Map.Entry)localIterator.next();
              Object localObject = localEntry.getKey();
              localObject = FilteredEntryMultimap.filterCollection((Collection)localEntry.getValue(), new FilteredEntryMultimap.ValuePredicate(FilteredEntryMultimap.this, localObject));
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
          return removeEntriesIf(Maps.valuePredicateOnEntries(Predicates.in(paramAnonymousCollection)));
        }
        
        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return removeEntriesIf(Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection))));
        }
      };
    }
    
    public Collection<V> get(@Nullable Object paramObject)
    {
      Collection localCollection = (Collection)unfiltered.asMap().get(paramObject);
      if (localCollection == null) {}
      do
      {
        return null;
        paramObject = FilteredEntryMultimap.filterCollection(localCollection, new FilteredEntryMultimap.ValuePredicate(FilteredEntryMultimap.this, paramObject));
      } while (((Collection)paramObject).isEmpty());
      return (Collection<V>)paramObject;
    }
    
    public Collection<V> remove(@Nullable Object paramObject)
    {
      Object localObject1 = (Collection)unfiltered.asMap().get(paramObject);
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
          if (FilteredEntryMultimap.this.satisfies(paramObject, localObject2))
          {
            ((Iterator)localObject1).remove();
            localArrayList.add(localObject2);
          }
        }
      } while (localArrayList.isEmpty());
      if ((unfiltered instanceof SetMultimap)) {
        return Collections.unmodifiableSet(Sets.newLinkedHashSet(localArrayList));
      }
      return Collections.unmodifiableList(localArrayList);
    }
  }
  
  class Keys
    extends Multimaps.Keys<K, V>
  {
    Keys()
    {
      super();
    }
    
    public Set<Multiset.Entry<K>> entrySet()
    {
      new Multisets.EntrySet()
      {
        private boolean removeEntriesIf(final Predicate<? super Multiset.Entry<K>> paramAnonymousPredicate)
        {
          FilteredEntryMultimap.this.removeEntriesIf(new Predicate()
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
          return keySet().size();
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
      Object localObject1 = (Collection)unfiltered.asMap().get(paramObject);
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
        if (FilteredEntryMultimap.this.satisfies(paramObject, localObject2))
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
  
  final class ValuePredicate
    implements Predicate<V>
  {
    private final K key;
    
    ValuePredicate()
    {
      Object localObject;
      key = localObject;
    }
    
    public boolean apply(@Nullable V paramV)
    {
      return FilteredEntryMultimap.this.satisfies(key, paramV);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredEntryMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */