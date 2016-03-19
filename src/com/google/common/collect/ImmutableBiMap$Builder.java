package com.google.common.collect;

import java.util.Map;

public final class ImmutableBiMap$Builder<K, V>
  extends ImmutableMap.Builder<K, V>
{
  public ImmutableBiMap<K, V> build()
  {
    switch (size)
    {
    default: 
      return new RegularImmutableBiMap(size, entries);
    case 0: 
      return ImmutableBiMap.of();
    }
    return ImmutableBiMap.of(entries[0].getKey(), entries[0].getValue());
  }
  
  public Builder<K, V> put(K paramK, V paramV)
  {
    super.put(paramK, paramV);
    return this;
  }
  
  public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
  {
    super.putAll(paramMap);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableBiMap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */