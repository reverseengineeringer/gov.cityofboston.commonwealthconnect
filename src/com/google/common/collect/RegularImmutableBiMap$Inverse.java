package com.google.common.collect;

import java.util.Map.Entry;
import javax.annotation.Nullable;

final class RegularImmutableBiMap$Inverse
  extends ImmutableBiMap<V, K>
{
  private RegularImmutableBiMap$Inverse(RegularImmutableBiMap paramRegularImmutableBiMap) {}
  
  ImmutableSet<Map.Entry<V, K>> createEntrySet()
  {
    return new InverseEntrySet();
  }
  
  public K get(@Nullable Object paramObject)
  {
    if (paramObject == null) {}
    for (;;)
    {
      return null;
      int i = Hashing.smear(paramObject.hashCode());
      int j = RegularImmutableBiMap.access$300(this$0);
      for (ImmutableMapEntry localImmutableMapEntry = RegularImmutableBiMap.access$400(this$0)[(i & j)]; localImmutableMapEntry != null; localImmutableMapEntry = localImmutableMapEntry.getNextInValueBucket()) {
        if (paramObject.equals(localImmutableMapEntry.getValue())) {
          return (K)localImmutableMapEntry.getKey();
        }
      }
    }
  }
  
  public ImmutableBiMap<K, V> inverse()
  {
    return this$0;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public int size()
  {
    return inverse().size();
  }
  
  Object writeReplace()
  {
    return new RegularImmutableBiMap.InverseSerializedForm(this$0);
  }
  
  final class InverseEntrySet
    extends ImmutableMapEntrySet<V, K>
  {
    InverseEntrySet() {}
    
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
          ImmutableMapEntry localImmutableMapEntry = RegularImmutableBiMap.access$000(this$0)[paramAnonymousInt];
          return Maps.immutableEntry(localImmutableMapEntry.getValue(), localImmutableMapEntry.getKey());
        }
      };
    }
    
    public int hashCode()
    {
      return RegularImmutableBiMap.access$100(this$0);
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
      return RegularImmutableBiMap.Inverse.this;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableBiMap.Inverse
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */