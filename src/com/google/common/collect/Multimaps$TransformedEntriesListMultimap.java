package com.google.common.collect;

import java.util.Collection;
import java.util.List;

final class Multimaps$TransformedEntriesListMultimap<K, V1, V2>
  extends Multimaps.TransformedEntriesMultimap<K, V1, V2>
  implements ListMultimap<K, V2>
{
  Multimaps$TransformedEntriesListMultimap(ListMultimap<K, V1> paramListMultimap, Maps.EntryTransformer<? super K, ? super V1, V2> paramEntryTransformer)
  {
    super(paramListMultimap, paramEntryTransformer);
  }
  
  public List<V2> get(K paramK)
  {
    return transform(paramK, fromMultimap.get(paramK));
  }
  
  public List<V2> removeAll(Object paramObject)
  {
    return transform(paramObject, fromMultimap.removeAll(paramObject));
  }
  
  public List<V2> replaceValues(K paramK, Iterable<? extends V2> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
  
  List<V2> transform(K paramK, Collection<V1> paramCollection)
  {
    return Lists.transform((List)paramCollection, Maps.asValueToValueFunction(transformer, paramK));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.TransformedEntriesListMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */