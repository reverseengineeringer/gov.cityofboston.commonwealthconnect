package com.google.common.collect;

import java.util.Map.Entry;
import java.util.Set;

class MapConstraints$ConstrainedSetMultimap<K, V>
  extends MapConstraints.ConstrainedMultimap<K, V>
  implements SetMultimap<K, V>
{
  MapConstraints$ConstrainedSetMultimap(SetMultimap<K, V> paramSetMultimap, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    super(paramSetMultimap, paramMapConstraint);
  }
  
  public Set<Map.Entry<K, V>> entries()
  {
    return (Set)super.entries();
  }
  
  public Set<V> get(K paramK)
  {
    return (Set)super.get(paramK);
  }
  
  public Set<V> removeAll(Object paramObject)
  {
    return (Set)super.removeAll(paramObject);
  }
  
  public Set<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    return (Set)super.replaceValues(paramK, paramIterable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */