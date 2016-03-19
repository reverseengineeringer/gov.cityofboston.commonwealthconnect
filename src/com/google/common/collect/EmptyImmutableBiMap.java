package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Map.Entry;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true)
final class EmptyImmutableBiMap
  extends ImmutableBiMap<Object, Object>
{
  static final EmptyImmutableBiMap INSTANCE = new EmptyImmutableBiMap();
  
  public ImmutableSetMultimap<Object, Object> asMultimap()
  {
    return ImmutableSetMultimap.of();
  }
  
  ImmutableSet<Map.Entry<Object, Object>> createEntrySet()
  {
    throw new AssertionError("should never be called");
  }
  
  public ImmutableSet<Map.Entry<Object, Object>> entrySet()
  {
    return ImmutableSet.of();
  }
  
  public Object get(@Nullable Object paramObject)
  {
    return null;
  }
  
  public ImmutableBiMap<Object, Object> inverse()
  {
    return this;
  }
  
  public boolean isEmpty()
  {
    return true;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public ImmutableSet<Object> keySet()
  {
    return ImmutableSet.of();
  }
  
  Object readResolve()
  {
    return INSTANCE;
  }
  
  public int size()
  {
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.EmptyImmutableBiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */