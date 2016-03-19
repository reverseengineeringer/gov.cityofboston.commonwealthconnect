package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.AbstractCollection;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class Maps$Values<K, V>
  extends AbstractCollection<V>
{
  final Map<K, V> map;
  
  Maps$Values(Map<K, V> paramMap)
  {
    map = ((Map)Preconditions.checkNotNull(paramMap));
  }
  
  public void clear()
  {
    map().clear();
  }
  
  public boolean contains(@Nullable Object paramObject)
  {
    return map().containsValue(paramObject);
  }
  
  public boolean isEmpty()
  {
    return map().isEmpty();
  }
  
  public Iterator<V> iterator()
  {
    return Maps.valueIterator(map().entrySet().iterator());
  }
  
  final Map<K, V> map()
  {
    return map;
  }
  
  public boolean remove(Object paramObject)
  {
    try
    {
      boolean bool = super.remove(paramObject);
      return bool;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException)
    {
      Iterator localIterator = map().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        if (Objects.equal(paramObject, localEntry.getValue()))
        {
          map().remove(localEntry.getKey());
          return true;
        }
      }
    }
    return false;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    try
    {
      boolean bool = super.removeAll((Collection)Preconditions.checkNotNull(paramCollection));
      return bool;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException)
    {
      HashSet localHashSet = Sets.newHashSet();
      Iterator localIterator = map().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        if (paramCollection.contains(localEntry.getValue())) {
          localHashSet.add(localEntry.getKey());
        }
      }
      return map().keySet().removeAll(localHashSet);
    }
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    try
    {
      boolean bool = super.retainAll((Collection)Preconditions.checkNotNull(paramCollection));
      return bool;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException)
    {
      HashSet localHashSet = Sets.newHashSet();
      Iterator localIterator = map().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        if (paramCollection.contains(localEntry.getValue())) {
          localHashSet.add(localEntry.getKey());
        }
      }
      return map().keySet().retainAll(localHashSet);
    }
  }
  
  public int size()
  {
    return map().size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Maps.Values
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */