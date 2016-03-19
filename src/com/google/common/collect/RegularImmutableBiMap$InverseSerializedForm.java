package com.google.common.collect;

import java.io.Serializable;

class RegularImmutableBiMap$InverseSerializedForm<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 1L;
  private final ImmutableBiMap<K, V> forward;
  
  RegularImmutableBiMap$InverseSerializedForm(ImmutableBiMap<K, V> paramImmutableBiMap)
  {
    forward = paramImmutableBiMap;
  }
  
  Object readResolve()
  {
    return forward.inverse();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableBiMap.InverseSerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */