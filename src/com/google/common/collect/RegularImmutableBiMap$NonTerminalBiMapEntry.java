package com.google.common.collect;

import javax.annotation.Nullable;

final class RegularImmutableBiMap$NonTerminalBiMapEntry<K, V>
  extends ImmutableMapEntry<K, V>
{
  @Nullable
  private final ImmutableMapEntry<K, V> nextInKeyBucket;
  @Nullable
  private final ImmutableMapEntry<K, V> nextInValueBucket;
  
  RegularImmutableBiMap$NonTerminalBiMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry1, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry2, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry3)
  {
    super(paramImmutableMapEntry1);
    nextInKeyBucket = paramImmutableMapEntry2;
    nextInValueBucket = paramImmutableMapEntry3;
  }
  
  RegularImmutableBiMap$NonTerminalBiMapEntry(K paramK, V paramV, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry1, @Nullable ImmutableMapEntry<K, V> paramImmutableMapEntry2)
  {
    super(paramK, paramV);
    nextInKeyBucket = paramImmutableMapEntry1;
    nextInValueBucket = paramImmutableMapEntry2;
  }
  
  @Nullable
  ImmutableMapEntry<K, V> getNextInKeyBucket()
  {
    return nextInKeyBucket;
  }
  
  @Nullable
  ImmutableMapEntry<K, V> getNextInValueBucket()
  {
    return nextInValueBucket;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableBiMap.NonTerminalBiMapEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */