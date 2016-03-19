package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class Multimaps$TransformedEntriesMultimap<K, V1, V2>
  extends AbstractMultimap<K, V2>
{
  final Multimap<K, V1> fromMultimap;
  final Maps.EntryTransformer<? super K, ? super V1, V2> transformer;
  
  Multimaps$TransformedEntriesMultimap(Multimap<K, V1> paramMultimap, Maps.EntryTransformer<? super K, ? super V1, V2> paramEntryTransformer)
  {
    fromMultimap = ((Multimap)Preconditions.checkNotNull(paramMultimap));
    transformer = ((Maps.EntryTransformer)Preconditions.checkNotNull(paramEntryTransformer));
  }
  
  public void clear()
  {
    fromMultimap.clear();
  }
  
  public boolean containsKey(Object paramObject)
  {
    return fromMultimap.containsKey(paramObject);
  }
  
  Map<K, Collection<V2>> createAsMap()
  {
    Maps.transformEntries(fromMultimap.asMap(), new Maps.EntryTransformer()
    {
      public Collection<V2> transformEntry(K paramAnonymousK, Collection<V1> paramAnonymousCollection)
      {
        return transform(paramAnonymousK, paramAnonymousCollection);
      }
    });
  }
  
  Collection<V2> createValues()
  {
    return Collections2.transform(fromMultimap.entries(), Maps.asEntryToValueFunction(transformer));
  }
  
  Iterator<Map.Entry<K, V2>> entryIterator()
  {
    return Iterators.transform(fromMultimap.entries().iterator(), Maps.asEntryToEntryFunction(transformer));
  }
  
  public Collection<V2> get(K paramK)
  {
    return transform(paramK, fromMultimap.get(paramK));
  }
  
  public boolean isEmpty()
  {
    return fromMultimap.isEmpty();
  }
  
  public Set<K> keySet()
  {
    return fromMultimap.keySet();
  }
  
  public Multiset<K> keys()
  {
    return fromMultimap.keys();
  }
  
  public boolean put(K paramK, V2 paramV2)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean putAll(Multimap<? extends K, ? extends V2> paramMultimap)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean putAll(K paramK, Iterable<? extends V2> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean remove(Object paramObject1, Object paramObject2)
  {
    return get(paramObject1).remove(paramObject2);
  }
  
  public Collection<V2> removeAll(Object paramObject)
  {
    return transform(paramObject, fromMultimap.removeAll(paramObject));
  }
  
  public Collection<V2> replaceValues(K paramK, Iterable<? extends V2> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  public int size()
  {
    return fromMultimap.size();
  }
  
  Collection<V2> transform(K paramK, Collection<V1> paramCollection)
  {
    paramK = Maps.asValueToValueFunction(transformer, paramK);
    if ((paramCollection instanceof List)) {
      return Lists.transform((List)paramCollection, paramK);
    }
    return Collections2.transform(paramCollection, paramK);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.TransformedEntriesMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */