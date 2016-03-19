package com.google.common.collect;

import java.util.Map.Entry;

final class RegularImmutableBiMap$Inverse$InverseEntrySet
  extends ImmutableMapEntrySet<V, K>
{
  RegularImmutableBiMap$Inverse$InverseEntrySet(RegularImmutableBiMap.Inverse paramInverse) {}
  
  ImmutableList<Map.Entry<V, K>> createAsList()
  {
    new ImmutableAsList()
    {
      ImmutableCollection<Map.Entry<V, K>> delegateCollection()
      {
        return RegularImmutableBiMap.Inverse.InverseEntrySet.this;
      }
      
      public Map.Entry<V, K> get(int paramAnonymousInt)
      {
        ImmutableMapEntry localImmutableMapEntry = RegularImmutableBiMap.access$000(this$1.this$0)[paramAnonymousInt];
        return Maps.immutableEntry(localImmutableMapEntry.getValue(), localImmutableMapEntry.getKey());
      }
    };
  }
  
  public int hashCode()
  {
    return RegularImmutableBiMap.access$100(this$1.this$0);
  }
  
  boolean isHashCodeFast()
  {
    return true;
  }
  
  public UnmodifiableIterator<Map.Entry<V, K>> iterator()
  {
    return asList().iterator();
  }
  
  ImmutableMap<V, K> map()
  {
    return this$1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableBiMap.Inverse.InverseEntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */