package com.google.common.collect;

import java.util.Map.Entry;

class ImmutableMapKeySet$1
  extends ImmutableAsList<K>
{
  ImmutableMapKeySet$1(ImmutableMapKeySet paramImmutableMapKeySet, ImmutableList paramImmutableList) {}
  
  ImmutableCollection<K> delegateCollection()
  {
    return this$0;
  }
  
  public K get(int paramInt)
  {
    return (K)((Map.Entry)val$entryList.get(paramInt)).getKey();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapKeySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */