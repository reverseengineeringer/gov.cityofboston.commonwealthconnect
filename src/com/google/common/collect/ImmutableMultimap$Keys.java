package com.google.common.collect;

import java.util.Collection;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class ImmutableMultimap$Keys
  extends ImmutableMultiset<K>
{
  ImmutableMultimap$Keys(ImmutableMultimap paramImmutableMultimap) {}
  
  public boolean contains(@Nullable Object paramObject)
  {
    return this$0.containsKey(paramObject);
  }
  
  public int count(@Nullable Object paramObject)
  {
    paramObject = (Collection)this$0.map.get(paramObject);
    if (paramObject == null) {
      return 0;
    }
    return ((Collection)paramObject).size();
  }
  
  public Set<K> elementSet()
  {
    return this$0.keySet();
  }
  
  Multiset.Entry<K> getEntry(int paramInt)
  {
    Map.Entry localEntry = (Map.Entry)this$0.map.entrySet().asList().get(paramInt);
    return Multisets.immutableEntry(localEntry.getKey(), ((Collection)localEntry.getValue()).size());
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public int size()
  {
    return this$0.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultimap.Keys
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */