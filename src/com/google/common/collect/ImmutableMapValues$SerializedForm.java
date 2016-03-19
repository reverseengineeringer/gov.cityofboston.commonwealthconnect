package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.io.Serializable;

@GwtIncompatible("serialization")
class ImmutableMapValues$SerializedForm<V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final ImmutableMap<?, V> map;
  
  ImmutableMapValues$SerializedForm(ImmutableMap<?, V> paramImmutableMap)
  {
    map = paramImmutableMap;
  }
  
  Object readResolve()
  {
    return map.values();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMapValues.SerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */