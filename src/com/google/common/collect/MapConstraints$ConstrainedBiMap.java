package com.google.common.collect;

import java.util.Set;
import javax.annotation.Nullable;

class MapConstraints$ConstrainedBiMap<K, V>
  extends MapConstraints.ConstrainedMap<K, V>
  implements BiMap<K, V>
{
  volatile BiMap<V, K> inverse;
  
  MapConstraints$ConstrainedBiMap(BiMap<K, V> paramBiMap, @Nullable BiMap<V, K> paramBiMap1, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    super(paramBiMap, paramMapConstraint);
    inverse = paramBiMap1;
  }
  
  protected BiMap<K, V> delegate()
  {
    return (BiMap)super.delegate();
  }
  
  public V forcePut(K paramK, V paramV)
  {
    constraint.checkKeyValue(paramK, paramV);
    return (V)delegate().forcePut(paramK, paramV);
  }
  
  public BiMap<V, K> inverse()
  {
    if (inverse == null) {
      inverse = new ConstrainedBiMap(delegate().inverse(), this, new MapConstraints.InverseConstraint(constraint));
    }
    return inverse;
  }
  
  public Set<V> values()
  {
    return delegate().values();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */