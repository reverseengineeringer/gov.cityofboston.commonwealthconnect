package com.google.common.collect;

import java.io.Serializable;

final class HashBiMap$InverseSerializedForm<K, V>
  implements Serializable
{
  private final HashBiMap<K, V> bimap;
  
  HashBiMap$InverseSerializedForm(HashBiMap<K, V> paramHashBiMap)
  {
    bimap = paramHashBiMap;
  }
  
  Object readResolve()
  {
    return bimap.inverse();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.HashBiMap.InverseSerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */