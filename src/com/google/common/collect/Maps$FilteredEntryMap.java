package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class Maps$FilteredEntryMap<K, V>
  extends Maps.AbstractFilteredMap<K, V>
{
  final Set<Map.Entry<K, V>> filteredEntrySet = Sets.filter(paramMap.entrySet(), predicate);
  
  Maps$FilteredEntryMap(Map<K, V> paramMap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    super(paramMap, paramPredicate);
  }
  
  protected Set<Map.Entry<K, V>> createEntrySet()
  {
    return new EntrySet(null);
  }
  
  Set<K> createKeySet()
  {
    return new KeySet();
  }
  
  private class EntrySet
    extends ForwardingSet<Map.Entry<K, V>>
  {
    private EntrySet() {}
    
    protected Set<Map.Entry<K, V>> delegate()
    {
      return filteredEntrySet;
    }
    
    public Iterator<Map.Entry<K, V>> iterator()
    {
      new TransformedIterator(filteredEntrySet.iterator())
      {
        Map.Entry<K, V> transform(final Map.Entry<K, V> paramAnonymousEntry)
        {
          new ForwardingMapEntry()
          {
            protected Map.Entry<K, V> delegate()
            {
              return paramAnonymousEntry;
            }
            
            public V setValue(V paramAnonymous2V)
            {
              Preconditions.checkArgument(apply(getKey(), paramAnonymous2V));
              return (V)super.setValue(paramAnonymous2V);
            }
          };
        }
      };
    }
  }
  
  class KeySet
    extends Maps.KeySet<K, V>
  {
    KeySet()
    {
      super();
    }
    
    private boolean removeIf(Predicate<? super K> paramPredicate)
    {
      return Iterables.removeIf(unfiltered.entrySet(), Predicates.and(predicate, Maps.keyPredicateOnEntries(paramPredicate)));
    }
    
    public boolean remove(Object paramObject)
    {
      if (containsKey(paramObject))
      {
        unfiltered.remove(paramObject);
        return true;
      }
      return false;
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      return removeIf(Predicates.in(paramCollection));
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      return removeIf(Predicates.not(Predicates.in(paramCollection)));
    }
    
    public Object[] toArray()
    {
      return Lists.newArrayList(iterator()).toArray();
    }
    
    public <T> T[] toArray(T[] paramArrayOfT)
    {
      return Lists.newArrayList(iterator()).toArray(paramArrayOfT);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */