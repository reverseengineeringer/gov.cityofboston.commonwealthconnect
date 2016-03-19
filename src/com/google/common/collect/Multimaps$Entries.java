package com.google.common.collect;

import java.util.AbstractCollection;
import java.util.Map.Entry;
import javax.annotation.Nullable;

abstract class Multimaps$Entries<K, V>
  extends AbstractCollection<Map.Entry<K, V>>
{
  public void clear()
  {
    multimap().clear();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      return multimap().containsEntry(((Map.Entry)paramObject).getKey(), ((Map.Entry)paramObject).getValue());
    }
    return false;
  }
  
  abstract Multimap<K, V> multimap();
  
  public boolean remove(@Nullable Object paramObject)
  {
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      return multimap().remove(((Map.Entry)paramObject).getKey(), ((Map.Entry)paramObject).getValue());
    }
    return false;
  }
  
  public int size()
  {
    return multimap().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.Entries
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */