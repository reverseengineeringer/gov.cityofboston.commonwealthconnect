package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(serializable=true)
class RegularImmutableMultiset<E>
  extends ImmutableMultiset<E>
{
  private final transient ImmutableMap<E, Integer> map;
  private final transient int size;
  
  RegularImmutableMultiset(ImmutableMap<E, Integer> paramImmutableMap, int paramInt)
  {
    map = paramImmutableMap;
    size = paramInt;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return map.containsKey(paramObject);
  }
  
  public int count(@Nullable Object paramObject)
  {
    paramObject = (Integer)map.get(paramObject);
    if (paramObject == null) {
      return 0;
    }
    return ((Integer)paramObject).intValue();
  }
  
  public ImmutableSet<E> elementSet()
  {
    return map.keySet();
  }
  
  Multiset.Entry<E> getEntry(int paramInt)
  {
    Map.Entry localEntry = (Map.Entry)map.entrySet().asList().get(paramInt);
    return Multisets.immutableEntry(localEntry.getKey(), ((Integer)localEntry.getValue()).intValue());
  }
  
  public int hashCode()
  {
    return map.hashCode();
  }
  
  boolean isPartialView()
  {
    return map.isPartialView();
  }
  
  public int size()
  {
    return size;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */