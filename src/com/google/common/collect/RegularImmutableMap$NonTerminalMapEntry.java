package com.google.common.collect;

import javax.annotation.Nullable;

final class RegularImmutableMap$NonTerminalMapEntry<K, V>
  extends ImmutableMapEntry<K, V>
{
  private final ImmutableMapEntry<K, V> nextInKeyBucket;
  
  RegularImmutableMap$NonTerminalMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry1, ImmutableMapEntry<K, V> paramImmutableMapEntry2)
  {
    super(paramImmutableMapEntry1);
    nextInKeyBucket = paramImmutableMapEntry2;
  }
  
  RegularImmutableMap$NonTerminalMapEntry(K paramK, V paramV, ImmutableMapEntry<K, V> paramImmutableMapEntry)
  {
    super(paramK, paramV);
    nextInKeyBucket = paramImmutableMapEntry;
  }
  
  ImmutableMapEntry<K, V> getNextInKeyBucket()
  {
    return nextInKeyBucket;
  }
  
  @Nullable
  ImmutableMapEntry<K, V> getNextInValueBucket()
  {
    return null;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableMap.NonTerminalMapEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */