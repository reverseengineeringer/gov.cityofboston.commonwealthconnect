package com.google.common.collect;

class MapConstraints$2$1
  implements Constraint<V>
{
  MapConstraints$2$1(MapConstraints.2 param2) {}
  
  public V checkElement(V paramV)
  {
    this$0.val$constraint.checkKeyValue(this$0.getKey(), paramV);
    return paramV;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.2.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */