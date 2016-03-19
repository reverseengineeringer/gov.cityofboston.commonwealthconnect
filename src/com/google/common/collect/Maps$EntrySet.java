package com.google.common.collect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

abstract class Maps$EntrySet<K, V>
  extends Sets.ImprovedAbstractSet<Map.Entry<K, V>>
{
  public void clear()
  {
    map().clear();
  }
  
  public boolean contains(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      Object localObject1 = ((Map.Entry)paramObject).getKey();
      Object localObject2 = Maps.safeGet(map(), localObject1);
      bool1 = bool2;
      if (Objects.equal(localObject2, ((Map.Entry)paramObject).getValue())) {
        if (localObject2 == null)
        {
          bool1 = bool2;
          if (!map().containsKey(localObject1)) {}
        }
        else
        {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public boolean isEmpty()
  {
    return map().isEmpty();
  }
  
  abstract Map<K, V> map();
  
  public boolean remove(Object paramObject)
  {
    if (contains(paramObject))
    {
      paramObject = (Map.Entry)paramObject;
      return map().keySet().remove(((Map.Entry)paramObject).getKey());
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
    catch (UnsupportedOperationException localUnsupportedOperationException) {}
    return Sets.removeAllImpl(this, paramCollection.iterator());
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
      HashSet localHashSet = Sets.newHashSetWithExpectedSize(paramCollection.size());
      paramCollection = paramCollection.iterator();
      while (paramCollection.hasNext())
      {
        Object localObject = paramCollection.next();
        if (contains(localObject)) {
          localHashSet.add(((Map.Entry)localObject).getKey());
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
 * Qualified Name:     com.google.common.collect.Maps.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */