package com.google.common.collect;

import java.util.Map.Entry;

class RegularImmutableSortedMap$EntrySet$1
  extends ImmutableAsList<Map.Entry<K, V>>
{
  private final ImmutableList<K> keyList = this$1.this$0.keySet().asList();
  
  RegularImmutableSortedMap$EntrySet$1(RegularImmutableSortedMap.EntrySet paramEntrySet) {}
  
  ImmutableCollection<Map.Entry<K, V>> delegateCollection()
  {
    return this$1;
  }
  
  public Map.Entry<K, V> get(int paramInt)
  {
    return Maps.immutableEntry(keyList.get(paramInt), RegularImmutableSortedMap.access$100(this$1.this$0).get(paramInt));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableSortedMap.EntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */