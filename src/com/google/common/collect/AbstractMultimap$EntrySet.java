package com.google.common.collect;

import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class AbstractMultimap$EntrySet
  extends AbstractMultimap<K, V>.Entries
  implements Set<Map.Entry<K, V>>
{
  private AbstractMultimap$EntrySet(AbstractMultimap paramAbstractMultimap)
  {
    super(paramAbstractMultimap, null);
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
 * Qualified Name:     com.google.common.collect.AbstractMultimap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */