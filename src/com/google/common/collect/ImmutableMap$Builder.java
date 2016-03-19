package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class ImmutableMap$Builder<K, V>
{
  ImmutableMapEntry.TerminalEntry<K, V>[] entries;
  int size;
  
  public ImmutableMap$Builder()
  {
    this(4);
  }
  
  ImmutableMap$Builder(int paramInt)
  {
    entries = new ImmutableMapEntry.TerminalEntry[paramInt];
    size = 0;
  }
  
  private void ensureCapacity(int paramInt)
  {
    if (paramInt > entries.length) {
      entries = ((ImmutableMapEntry.TerminalEntry[])ObjectArrays.arraysCopyOf(entries, ImmutableCollection.Builder.expandedCapacity(entries.length, paramInt)));
    }
  }
  
  public ImmutableMap<K, V> build()
  {
    switch (size)
    {
    default: 
      return new RegularImmutableMap(size, entries);
    case 0: 
      return ImmutableMap.of();
    }
    return ImmutableMap.of(entries[0].getKey(), entries[0].getValue());
  }
  
  public Builder<K, V> put(K paramK, V paramV)
  {
    ensureCapacity(size + 1);
    paramK = ImmutableMap.entryOf(paramK, paramV);
    paramV = entries;
    int i = size;
    size = (i + 1);
    paramV[i] = paramK;
    return this;
  }
  
  public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
  {
    return put(paramEntry.getKey(), paramEntry.getValue());
  }
  
  public Builder<K, V> putAll(Map<? extends K, ? extends V> paramMap)
  {
    ensureCapacity(size + paramMap.size());
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext()) {
      put((Map.Entry)paramMap.next());
    }
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */