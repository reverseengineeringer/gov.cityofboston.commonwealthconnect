package com.google.common.collect;

import java.util.Collections;
import java.util.List;

class Multimaps$UnmodifiableListMultimap<K, V>
  extends Multimaps.UnmodifiableMultimap<K, V>
  implements ListMultimap<K, V>
{
  private static final long serialVersionUID = 0L;
  
  Multimaps$UnmodifiableListMultimap(ListMultimap<K, V> paramListMultimap)
  {
    super(paramListMultimap);
  }
  
  public ListMultimap<K, V> delegate()
  {
    return (ListMultimap)super.delegate();
  }
  
  public List<V> get(K paramK)
  {
    return Collections.unmodifiableList(delegate().get(paramK));
  }
  
  public List<V> removeAll(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public List<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.UnmodifiableListMultimap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */