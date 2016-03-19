package com.google.common.collect;

import java.util.List;

class MapConstraints$ConstrainedListMultimap<K, V>
  extends MapConstraints.ConstrainedMultimap<K, V>
  implements ListMultimap<K, V>
{
  MapConstraints$ConstrainedListMultimap(ListMultimap<K, V> paramListMultimap, MapConstraint<? super K, ? super V> paramMapConstraint)
  {
    super(paramListMultimap, paramMapConstraint);
  }
  
  public List<V> get(K paramK)
  {
    return (List)super.get(paramK);
  }
  
  public List<V> removeAll(Object paramObject)
  {
    return (List)super.removeAll(paramObject);
  }
  
  public List<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    return (List)super.replaceValues(paramK, paramIterable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapConstraints.ConstrainedListMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */