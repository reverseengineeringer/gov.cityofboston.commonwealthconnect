package com.google.common.collect;

import java.util.Map.Entry;

class RegularImmutableBiMap$Inverse$InverseEntrySet$1
  extends ImmutableAsList<Map.Entry<V, K>>
{
  RegularImmutableBiMap$Inverse$InverseEntrySet$1(RegularImmutableBiMap.Inverse.InverseEntrySet paramInverseEntrySet) {}
  
  ImmutableCollection<Map.Entry<V, K>> delegateCollection()
  {
    return this$2;
  }
  
  public Map.Entry<V, K> get(int paramInt)
  {
    ImmutableMapEntry localImmutableMapEntry = RegularImmutableBiMap.access$000(this$2.this$1.this$0)[paramInt];
    return Maps.immutableEntry(localImmutableMapEntry.getValue(), localImmutableMapEntry.getKey());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableBiMap.Inverse.InverseEntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */