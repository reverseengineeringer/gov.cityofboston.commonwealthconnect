package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

final class Maps$FilteredEntryBiMap<K, V>
  extends Maps.FilteredEntryMap<K, V>
  implements BiMap<K, V>
{
  private final BiMap<V, K> inverse;
  
  Maps$FilteredEntryBiMap(BiMap<K, V> paramBiMap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    super(paramBiMap, paramPredicate);
    inverse = new FilteredEntryBiMap(paramBiMap.inverse(), inversePredicate(paramPredicate), this);
  }
  
  private Maps$FilteredEntryBiMap(BiMap<K, V> paramBiMap, Predicate<? super Map.Entry<K, V>> paramPredicate, BiMap<V, K> paramBiMap1)
  {
    super(paramBiMap, paramPredicate);
    inverse = paramBiMap1;
  }
  
  private static <K, V> Predicate<Map.Entry<V, K>> inversePredicate(Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    new Predicate()
    {
      public boolean apply(Map.Entry<V, K> paramAnonymousEntry)
      {
        return val$forwardPredicate.apply(Maps.immutableEntry(paramAnonymousEntry.getValue(), paramAnonymousEntry.getKey()));
      }
    };
  }
  
  public V forcePut(@Nullable K paramK, @Nullable V paramV)
  {
    Preconditions.checkArgument(apply(paramK, paramV));
    return (V)unfiltered().forcePut(paramK, paramV);
  }
  
  public BiMap<V, K> inverse()
  {
    return inverse;
  }
  
  BiMap<K, V> unfiltered()
  {
    return (BiMap)unfiltered;
  }
  
  public Set<V> values()
  {
    return inverse.keySet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.FilteredEntryBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */