package com.google.common.collect;

import java.util.Map.Entry;

final class MapConstraints$1
  extends ForwardingMapEntry<K, V>
{
  MapConstraints$1(Map.Entry paramEntry, MapConstraint paramMapConstraint) {}
  
  protected Map.Entry<K, V> delegate()
  {
    return val$entry;
  }
  
  public V setValue(V paramV)
  {
    val$constraint.checkKeyValue(getKey(), paramV);
    return (V)val$entry.setValue(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */