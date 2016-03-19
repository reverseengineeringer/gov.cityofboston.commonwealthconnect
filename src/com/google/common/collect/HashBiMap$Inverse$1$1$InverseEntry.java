package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;

class HashBiMap$Inverse$1$1$InverseEntry
  extends AbstractMapEntry<V, K>
{
  HashBiMap.BiEntry<K, V> delegate;
  
  HashBiMap$Inverse$1$1$InverseEntry(HashBiMap.BiEntry<K, V> paramBiEntry)
  {
    HashBiMap.BiEntry localBiEntry;
    delegate = localBiEntry;
  }
  
  public V getKey()
  {
    return (V)delegate.value;
  }
  
  public K getValue()
  {
    return (K)delegate.key;
  }
  
  public K setValue(K paramK)
  {
    Object localObject = delegate.key;
    int i = HashBiMap.access$300(paramK);
    if ((i == delegate.keyHash) && (Objects.equal(paramK, localObject))) {
      return paramK;
    }
    if (HashBiMap.access$400(this$3.this$2.this$1.this$0, paramK, i) == null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "value already present: %s", new Object[] { paramK });
      HashBiMap.access$200(this$3.this$2.this$1.this$0, delegate);
      paramK = new HashBiMap.BiEntry(paramK, i, delegate.value, delegate.valueHash);
      HashBiMap.access$700(this$3.this$2.this$1.this$0, paramK);
      this$3.expectedModCount = HashBiMap.access$000(this$3.this$2.this$1.this$0);
      return (K)localObject;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.HashBiMap.Inverse.1.1.InverseEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */