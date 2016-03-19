package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;

@GwtIncompatible("serialization")
class ImmutableMapEntrySet$EntrySetSerializedForm<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final ImmutableMap<K, V> map;
  
  ImmutableMapEntrySet$EntrySetSerializedForm(ImmutableMap<K, V> paramImmutableMap)
  {
    map = paramImmutableMap;
  }
  
  Object readResolve()
  {
    return map.entrySet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapEntrySet.EntrySetSerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */