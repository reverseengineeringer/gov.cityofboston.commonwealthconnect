package com.google.common.collect;

import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class MapConstraints$ConstrainedEntrySet<K, V>
  extends MapConstraints.ConstrainedEntries<K, V>
  implements Set<Map.Entry<K, V>>
{
  MapConstraints$ConstrainedEntrySet(Set<Map.Entry<K, V>> paramSet, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    super(paramSet, paramMapConstraint);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return Sets.equalsImpl(this, paramObject);
  }
  
  public int hashCode()
  {
    return Sets.hashCodeImpl(this);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedEntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */