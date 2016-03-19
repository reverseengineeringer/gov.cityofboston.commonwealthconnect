package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;

@GwtIncompatible("serialization")
class ImmutableMapKeySet$KeySetSerializedForm<K>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final ImmutableMap<K, ?> map;
  
  ImmutableMapKeySet$KeySetSerializedForm(ImmutableMap<K, ?> paramImmutableMap)
  {
    map = paramImmutableMap;
  }
  
  Object readResolve()
  {
    return map.keySet();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapKeySet.KeySetSerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */