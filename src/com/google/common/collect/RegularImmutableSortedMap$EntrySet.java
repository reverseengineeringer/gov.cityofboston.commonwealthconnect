package com.google.common.collect;

import java.util.Map.Entry;

class RegularImmutableSortedMap$EntrySet
  extends ImmutableMapEntrySet<K, V>
{
  private RegularImmutableSortedMap$EntrySet(RegularImmutableSortedMap paramRegularImmutableSortedMap) {}
  
  ImmutableList<Map.Entry<K, V>> createAsList()
  {
    new ImmutableAsList()
    {
      private final ImmutableList<K> keyList = this$0.keySet().asList();
      
      ImmutableCollection<Map.Entry<K, V>> delegateCollection()
      {
        return RegularImmutableSortedMap.EntrySet.this;
      }
      
      public Map.Entry<K, V> get(int paramAnonymousInt)
      {
        return Maps.immutableEntry(keyList.get(paramAnonymousInt), RegularImmutableSortedMap.access$100(this$0).get(paramAnonymousInt));
      }
    };
  }
  
  public UnmodifiableIterator<Map.Entry<K, V>> iterator()
  {
    return asList().iterator();
  }
  
  ImmutableMap<K, V> map()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableSortedMap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */