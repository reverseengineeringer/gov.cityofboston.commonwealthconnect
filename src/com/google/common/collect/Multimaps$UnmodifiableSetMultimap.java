package com.google.common.collect;

import java.util.Collections;
import java.util.Map.Entry;
import java.util.Set;

class Multimaps$UnmodifiableSetMultimap<K, V>
  extends Multimaps.UnmodifiableMultimap<K, V>
  implements SetMultimap<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Multimaps$UnmodifiableSetMultimap(SetMultimap<K, V> paramSetMultimap)
  {
    super(paramSetMultimap);
  }
  
  public SetMultimap<K, V> delegate()
  {
    return (SetMultimap)super.delegate();
  }
  
  public Set<Map.Entry<K, V>> entries()
  {
    return Maps.unmodifiableEntrySet(delegate().entries());
  }
  
  public Set<V> get(K paramK)
  {
    return Collections.unmodifiableSet(delegate().get(paramK));
  }
  
  public Set<V> removeAll(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public Set<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.UnmodifiableSetMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */