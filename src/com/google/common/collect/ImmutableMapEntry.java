package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import javax.annotation.Nullable;

@GwtIncompatible("unnecessary")
abstract class ImmutableMapEntry<K, V>
  extends ImmutableEntry<K, V>
{
  ImmutableMapEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry)
  {
    super(paramImmutableMapEntry.getKey(), paramImmutableMapEntry.getValue());
  }
  
  ImmutableMapEntry(K paramK, V paramV)
  {
    super(paramK, paramV);
    CollectPreconditions.checkEntryNotNull(paramK, paramV);
  }
  
  @Nullable
  abstract ImmutableMapEntry<K, V> getNextInKeyBucket();
  
  @Nullable
  abstract ImmutableMapEntry<K, V> getNextInValueBucket();
  
  static final class TerminalEntry<K, V>
    extends ImmutableMapEntry<K, V>
  {
    TerminalEntry(ImmutableMapEntry<K, V> paramImmutableMapEntry)
    {
      super();
    }
    
    TerminalEntry(K paramK, V paramV)
    {
      super(paramV);
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
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */