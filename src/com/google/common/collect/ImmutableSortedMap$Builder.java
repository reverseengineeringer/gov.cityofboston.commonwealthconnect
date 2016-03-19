package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Map;
import java.util.Map.Entry;

public class ImmutableSortedMap$Builder<K, V>
  extends ImmutableMap.Builder<K, V>
{
  private final Comparator<? super K> comparator;
  
  public ImmutableSortedMap$Builder(Comparator<? super K> paramComparator)
  {
    comparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
  }
  
  public ImmutableSortedMap<K, V> build()
  {
    return ImmutableSortedMap.fromEntries(comparator, false, size, entries);
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
  
  public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
  {
    super.putAll(paramMap);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSortedMap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */