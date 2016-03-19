package com.google.common.collect;

import java.util.Comparator;
import java.util.Map.Entry;

public final class ImmutableListMultimap$Builder<K, V>
  extends ImmutableMultimap.Builder<K, V>
{
  public ImmutableListMultimap<K, V> build()
  {
    return (ImmutableListMultimap)super.build();
  }
  
  public Builder<K, V> orderKeysBy(Comparator<? super K> paramComparator)
  {
    super.orderKeysBy(paramComparator);
    return this;
  }
  
  public Builder<K, V> orderValuesBy(Comparator<? super V> paramComparator)
  {
    super.orderValuesBy(paramComparator);
    return this;
  }
  
  public Builder<K, V> put(K paramK, V paramV)
  {
    super.put(paramK, paramV);
    return this;
  }
  
  public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
  {
    super.put(paramEntry);
    return this;
  }
  
  public Builder<K, V> putAll(Multimap<? extends K, ? extends V> paramMultimap)
  {
    super.putAll(paramMultimap);
    return this;
  }
  
  public Builder<K, V> putAll(K paramK, Iterable<? extends V> paramIterable)
  {
    super.putAll(paramK, paramIterable);
    return this;
  }
  
  public Builder<K, V> putAll(K paramK, V... paramVarArgs)
  {
    super.putAll(paramK, paramVarArgs);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableListMultimap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */