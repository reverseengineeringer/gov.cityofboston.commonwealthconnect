package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
class FilteredKeyMultimap<K, V>
  extends AbstractMultimap<K, V>
  implements FilteredMultimap<K, V>
{
  final Predicate<? super K> keyPredicate;
  final Multimap<K, V> unfiltered;
  
  FilteredKeyMultimap(Multimap<K, V> paramMultimap, Predicate<? super K> paramPredicate)
  {
    unfiltered = ((Multimap)Preconditions.checkNotNull(paramMultimap));
    keyPredicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
  }
  
  public void clear()
  {
    keySet().clear();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    if (unfiltered.containsKey(paramObject)) {
      return keyPredicate.apply(paramObject);
    }
    return false;
  }
  
  Map<K, Collection<V>> createAsMap()
  {
    return Maps.filterKeys(unfiltered.asMap(), keyPredicate);
  }
  
  Collection<Map.Entry<K, V>> createEntries()
  {
    return new Entries();
  }
  
  Set<K> createKeySet()
  {
    return Sets.filter(unfiltered.keySet(), keyPredicate);
  }
  
  Multiset<K> createKeys()
  {
    return Multisets.filter(unfiltered.keys(), keyPredicate);
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
    return Maps.keyPredicateOnEntries(keyPredicate);
  }
  
  public Collection<V> get(K paramK)
  {
    if (keyPredicate.apply(paramK)) {
      return unfiltered.get(paramK);
    }
    if ((unfiltered instanceof SetMultimap)) {
      return new AddRejectingSet(paramK);
    }
    return new AddRejectingList(paramK);
  }
  
  public Collection<V> removeAll(Object paramObject)
  {
    if (containsKey(paramObject)) {
      return unfiltered.removeAll(paramObject);
    }
    return unmodifiableEmptyCollection();
  }
  
  public int size()
  {
    int i = 0;
    Iterator localIterator = asMap().values().iterator();
    while (localIterator.hasNext()) {
      i += ((Collection)localIterator.next()).size();
    }
    return i;
  }
  
  public Multimap<K, V> unfiltered()
  {
    return unfiltered;
  }
  
  Collection<V> unmodifiableEmptyCollection()
  {
    if ((unfiltered instanceof SetMultimap)) {
      return ImmutableSet.of();
    }
    return ImmutableList.of();
  }
  
  static class AddRejectingList<K, V>
    extends ForwardingList<V>
  {
    final K key;
    
    AddRejectingList(K paramK)
    {
      key = paramK;
    }
    
    public void add(int paramInt, V paramV)
    {
      Preconditions.checkPositionIndex(paramInt, 0);
      throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
    }
    
    public boolean add(V paramV)
    {
      add(0, paramV);
      return true;
    }
    
    public boolean addAll(int paramInt, Collection<? extends V> paramCollection)
    {
      Preconditions.checkNotNull(paramCollection);
      Preconditions.checkPositionIndex(paramInt, 0);
      throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
    }
    
    public boolean addAll(Collection<? extends V> paramCollection)
    {
      addAll(0, paramCollection);
      return true;
    }
    
    protected List<V> delegate()
    {
      return Collections.emptyList();
    }
  }
  
  static class AddRejectingSet<K, V>
    extends ForwardingSet<V>
  {
    final K key;
    
    AddRejectingSet(K paramK)
    {
      key = paramK;
    }
    
    public boolean add(V paramV)
    {
      throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
    }
    
    public boolean addAll(Collection<? extends V> paramCollection)
    {
      Preconditions.checkNotNull(paramCollection);
      throw new IllegalArgumentException("Key does not satisfy predicate: " + key);
    }
    
    protected Set<V> delegate()
    {
      return Collections.emptySet();
    }
  }
  
  class Entries
    extends ForwardingCollection<Map.Entry<K, V>>
  {
    Entries() {}
    
    protected Collection<Map.Entry<K, V>> delegate()
    {
      return Collections2.filter(unfiltered.entries(), entryPredicate());
    }
    
    public boolean remove(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        paramObject = (Map.Entry)paramObject;
        if ((unfiltered.containsKey(((Map.Entry)paramObject).getKey())) && (keyPredicate.apply(((Map.Entry)paramObject).getKey()))) {
          return unfiltered.remove(((Map.Entry)paramObject).getKey(), ((Map.Entry)paramObject).getValue());
        }
      }
      return false;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.FilteredKeyMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */