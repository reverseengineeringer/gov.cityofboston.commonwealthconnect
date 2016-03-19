package com.google.common.collect;

import java.util.Map.Entry;
import javax.annotation.Nullable;

final class ImmutableSetMultimap$EntrySet<K, V>
  extends ImmutableSet<Map.Entry<K, V>>
{
  private final transient ImmutableSetMultimap<K, V> multimap;
  
  ImmutableSetMultimap$EntrySet(ImmutableSetMultimap<K, V> paramImmutableSetMultimap)
  {
    multimap = paramImmutableSetMultimap;
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      return multimap.containsEntry(((Map.Entry)paramObject).getKey(), ((Map.Entry)paramObject).getValue());
    }
    return false;
  }
  
  boolean isPartialView()
  {
    return false;
  }
  
  public UnmodifiableIterator<Map.Entry<K, V>> iterator()
  {
    return multimap.entryIterator();
  }
  
  public int size()
  {
    return multimap.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableSetMultimap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */