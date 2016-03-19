package com.google.common.collect;

class MapConstraints$ConstrainedMultimap$2
  implements Constraint<V>
{
  MapConstraints$ConstrainedMultimap$2(MapConstraints.ConstrainedMultimap paramConstrainedMultimap, Object paramObject) {}
  
  public V checkElement(V paramV)
  {
    this$0.constraint.checkKeyValue(val$key, paramV);
    return paramV;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedMultimap.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */