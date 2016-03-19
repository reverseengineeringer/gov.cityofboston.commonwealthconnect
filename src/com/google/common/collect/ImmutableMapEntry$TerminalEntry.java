package com.google.common.collect;

import javax.annotation.Nullable;

final class ImmutableMapEntry$TerminalEntry<K, V>
  extends ImmutableMapEntry<K, V>
{
  ImmutableMapEntry$TerminalEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry)
  {
    super(paramImmutableMapEntry);
  }
  
  ImmutableMapEntry$TerminalEntry(K paramK, V paramV)
  {
    super(paramK, paramV);
  }
  
  @Nullable
  ImmutableMapEntry<K, V> getNextInKeyBucket()
  {
    return null;
  }
  
  @Nullable
  ImmutableMapEntry<K, V> getNextInValueBucket()
  {
    return null;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapEntry.TerminalEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */