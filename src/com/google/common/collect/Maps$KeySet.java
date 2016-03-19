package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class Maps$KeySet<K, V>
  extends Sets.ImprovedAbstractSet<K>
{
  final Map<K, V> map;
  
  Maps$KeySet(Map<K, V> paramMap)
  {
    map = ((Map)Preconditions.checkNotNull(paramMap));
  }
  
  public void clear()
  {
    map().clear();
  }
  
  public boolean contains(Object paramObject)
  {
    return map().containsKey(paramObject);
  }
  
  public boolean isEmpty()
  {
    return map().isEmpty();
  }
  
  public Iterator<K> iterator()
  {
    return Maps.keyIterator(map().entrySet().iterator());
  }
  
  Map<K, V> map()
  {
    return map;
  }
  
  public boolean remove(Object paramObject)
  {
    if (contains(paramObject))
    {
      map().remove(paramObject);
      return true;
    }
    return false;
  }
  
  public int size()
  {
    return map().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.KeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */