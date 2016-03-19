package com.google.common.collect;

import java.io.Serializable;
import java.util.EnumMap;

class ImmutableEnumMap$EnumSerializedForm<K extends Enum<K>, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final EnumMap<K, V> delegate;
  
  ImmutableEnumMap$EnumSerializedForm(EnumMap<K, V> paramEnumMap)
  {
    delegate = paramEnumMap;
  }
  
  Object readResolve()
  {
    return new ImmutableEnumMap(delegate, null);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableEnumMap.EnumSerializedForm
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */