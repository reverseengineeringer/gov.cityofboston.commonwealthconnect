package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Iterator;
import javax.annotation.Nullable;

final class ImmutableMultimap$Values<K, V>
  extends ImmutableCollection<V>
{
  private static final long serialVersionUID = 0L;
  private final transient ImmutableMultimap<K, V> multimap;
  
  ImmutableMultimap$Values(ImmutableMultimap<K, V> paramImmutableMultimap)
  {
    multimap = paramImmutableMultimap;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return multimap.containsValue(paramObject);
  }
  
  @GwtIncompatible("not present in emulated superclass")
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    Iterator localIterator = multimap.map.values().iterator();
    while (localIterator.hasNext()) {
      paramInt = ((ImmutableCollection)localIterator.next()).copyIntoArray(paramArrayOfObject, paramInt);
    }
    return paramInt;
  }
  
  boolean isPartialView()
  {
    return true;
  }
  
  public UnmodifiableIterator<V> iterator()
  {
    return multimap.valueIterator();
  }
  
  public int size()
  {
    return multimap.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableMultimap.Values
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */