package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.Map.Entry;

class HashBiMap$EntrySet$1
  extends HashBiMap<K, V>.Itr<Map.Entry<K, V>>
{
  HashBiMap$EntrySet$1(HashBiMap.EntrySet paramEntrySet)
  {
    super(this$0);
  }
  
  Map.Entry<K, V> output(HashBiMap.BiEntry<K, V> paramBiEntry)
  {
    return new MapEntry(paramBiEntry);
  }
  
  class MapEntry
    extends AbstractMapEntry<K, V>
  {
    HashBiMap.BiEntry<K, V> delegate;
    
    MapEntry()
    {
      HashBiMap.BiEntry localBiEntry;
      delegate = localBiEntry;
    }
    
    public K getKey()
    {
      return (K)delegate.key;
    }
    
    public V getValue()
    {
      return (V)delegate.value;
    }
    
    public V setValue(V paramV)
    {
      Object localObject = delegate.value;
      int i = HashBiMap.access$300(paramV);
      if ((i == delegate.valueHash) && (Objects.equal(paramV, localObject))) {
        return paramV;
      }
      if (HashBiMap.access$600(this$1.this$0, paramV, i) == null) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "value already present: %s", new Object[] { paramV });
        HashBiMap.access$200(this$1.this$0, delegate);
        paramV = new HashBiMap.BiEntry(delegate.key, delegate.keyHash, paramV, i);
        HashBiMap.access$700(this$1.this$0, paramV);
        expectedModCount = HashBiMap.access$000(this$1.this$0);
        if (toRemove == delegate) {
          toRemove = paramV;
        }
        delegate = paramV;
        return (V)localObject;
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.HashBiMap.EntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */