package com.google.common.collect;

import java.util.Map.Entry;

class ImmutableMultimap$EntryCollection<K, V>
  extends ImmutableCollection<Map.Entry<K, V>>
{
  private static final long serialVersionUID = 0L;
  final ImmutableMultimap<K, V> multimap;
  
  ImmutableMultimap$EntryCollection(ImmutableMultimap<K, V> paramImmutableMultimap)
  {
    multimap = paramImmutableMultimap;
  }
  
  public boolean contains(Object paramObject)
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
    return multimap.isPartialView();
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
 * Qualified Name:     com.google.common.collect.ImmutableMultimap.EntryCollection
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */