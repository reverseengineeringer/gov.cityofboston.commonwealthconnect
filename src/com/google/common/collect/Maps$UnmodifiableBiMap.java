package com.google.common.collect;

import java.io.Serializable;
import java.util.Collections;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

class Maps$UnmodifiableBiMap<K, V>
  extends ForwardingMap<K, V>
  implements BiMap<K, V>, Serializable
{
  private static final long serialVersionUID = 0L;
  final BiMap<? extends K, ? extends V> delegate;
  BiMap<V, K> inverse;
  final Map<K, V> unmodifiableMap;
  transient Set<V> values;
  
  Maps$UnmodifiableBiMap(BiMap<? extends K, ? extends V> paramBiMap, @Nullable BiMap<V, K> paramBiMap1)
  {
    unmodifiableMap = Collections.unmodifiableMap(paramBiMap);
    delegate = paramBiMap;
    inverse = paramBiMap1;
  }
  
  protected Map<K, V> delegate()
  {
    return unmodifiableMap;
  }
  
  public V forcePut(K paramK, V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public BiMap<V, K> inverse()
  {
    BiMap localBiMap = inverse;
    Object localObject = localBiMap;
    if (localBiMap == null)
    {
      localObject = new UnmodifiableBiMap(delegate.inverse(), this);
      inverse = ((BiMap)localObject);
    }
    return (BiMap<V, K>)localObject;
  }
  
  public Set<V> values()
  {
    Set localSet2 = values;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = Collections.unmodifiableSet(delegate.values());
      values = localSet1;
    }
    return localSet1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.UnmodifiableBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */