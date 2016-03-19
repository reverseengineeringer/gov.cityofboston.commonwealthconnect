package com.google.common.collect;

import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Maps$UnmodifiableEntrySet<K, V>
  extends Maps.UnmodifiableEntries<K, V>
  implements Set<Map.Entry<K, V>>
{
  Maps$UnmodifiableEntrySet(Set<Map.Entry<K, V>> paramSet)
  {
    super(paramSet);
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
 * Qualified Name:     com.google.common.collect.Maps.UnmodifiableEntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */