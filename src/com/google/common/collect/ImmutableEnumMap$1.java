package com.google.common.collect;

import java.util.EnumMap;
import java.util.Set;

class ImmutableEnumMap$1
  extends ImmutableSet<K>
{
  ImmutableEnumMap$1(ImmutableEnumMap paramImmutableEnumMap) {}
  
  public boolean contains(Object paramObject)
  {
    return ImmutableEnumMap.access$000(this$0).containsKey(paramObject);
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public UnmodifiableIterator<K> iterator()
  {
    return Iterators.unmodifiableIterator(ImmutableEnumMap.access$000(this$0).keySet().iterator());
  }
  
  public int size()
  {
    return this$0.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableEnumMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */