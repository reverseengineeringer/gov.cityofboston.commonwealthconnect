package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.io.Serializable;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
class ImmutableEntry<K, V>
  extends AbstractMapEntry<K, V>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final K key;
  final V value;
  
  ImmutableEntry(@Nullable K paramK, @Nullable V paramV)
  {
    key = paramK;
    value = paramV;
  }
  
  @Nullable
  public final K getKey()
  {
    return (K)key;
  }
  
  @Nullable
  public final V getValue()
  {
    return (V)value;
  }
  
  public final V setValue(V paramV)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */