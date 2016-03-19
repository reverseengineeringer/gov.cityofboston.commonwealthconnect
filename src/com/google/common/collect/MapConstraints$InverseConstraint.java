package com.google.common.collect;

import com.google.common.base.Preconditions;

class MapConstraints$InverseConstraint<K, V>
  implements MapConstraint<K, V>
{
  final MapConstraint<? super V, ? super K> constraint;
  
  public MapConstraints$InverseConstraint(MapConstraint<? super V, ? super K> paramMapConstraint)
  {
    constraint = ((MapConstraint)Preconditions.checkNotNull(paramMapConstraint));
  }
  
  public void checkKeyValue(K paramK, V paramV)
  {
    constraint.checkKeyValue(paramV, paramK);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.InverseConstraint
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */