package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class MapConstraints$ConstrainedMap<K, V>
  extends ForwardingMap<K, V>
{
  final MapConstraint<? super K, ? super V> constraint;
  private final Map<K, V> delegate;
  private transient Set<Map.Entry<K, V>> entrySet;
  
  MapConstraints$ConstrainedMap(Map<K, V> paramMap, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    delegate = ((Map)Preconditions.checkNotNull(paramMap));
    constraint = ((MapConstraint)Preconditions.checkNotNull(paramMapConstraint));
  }
  
  protected Map<K, V> delegate()
  {
    return delegate;
  }
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    Set localSet2 = entrySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = MapConstraints.access$000(delegate.entrySet(), constraint);
      entrySet = localSet1;
    }
    return localSet1;
  }
  
  public V put(K paramK, V paramV)
  {
    constraint.checkKeyValue(paramK, paramV);
    return (V)delegate.put(paramK, paramV);
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    delegate.putAll(MapConstraints.access$100(paramMap, constraint));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */