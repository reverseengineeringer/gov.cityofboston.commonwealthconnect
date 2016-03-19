package com.seeclickfix.ma.android.objects;

import java.util.AbstractMap.SimpleImmutableEntry;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class SimpleMultiMap<K, V>
  implements Map<K, V>
{
  private HashMap<K, Set<V>> contents = new HashMap();
  
  public void clear()
  {
    contents.clear();
  }
  
  public boolean containsKey(Object paramObject)
  {
    return contents.containsKey(paramObject);
  }
  
  public boolean containsValue(Object paramObject)
  {
    return values().contains(paramObject);
  }
  
  public Set<Map.Entry<K, V>> entrySet()
  {
    HashSet localHashSet = new HashSet();
    Iterator localIterator1 = contents.entrySet().iterator();
    while (localIterator1.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator1.next();
      Iterator localIterator2 = ((Set)localEntry.getValue()).iterator();
      while (localIterator2.hasNext())
      {
        Object localObject = localIterator2.next();
        localHashSet.add(new AbstractMap.SimpleImmutableEntry(localEntry.getKey(), localObject));
      }
    }
    return localHashSet;
  }
  
  public V get(Object paramObject)
  {
    if (contents.containsKey(paramObject)) {
      return (V)((Set)contents.get(paramObject)).toArray()[0];
    }
    return null;
  }
  
  public Set<V> getAll(Object paramObject)
  {
    return (Set)contents.get(paramObject);
  }
  
  public boolean isEmpty()
  {
    return contents.isEmpty();
  }
  
  public Set<K> keySet()
  {
    return contents.keySet();
  }
  
  public V put(K paramK, V paramV)
  {
    if (contents.containsKey(paramK))
    {
      ((Set)contents.get(paramK)).add(paramV);
      return paramV;
    }
    contents.put(paramK, new HashSet(Arrays.asList(new Object[] { paramV })));
    return null;
  }
  
  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      put(localEntry.getKey(), localEntry.getValue());
    }
  }
  
  public V remove(Object paramObject)
  {
    if (contents.containsKey(paramObject)) {
      return (V)((Set)contents.remove(paramObject)).toArray()[0];
    }
    return null;
  }
  
  public int size()
  {
    return entrySet().size();
  }
  
  public Collection<V> values()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator1 = contents.values().iterator();
    while (localIterator1.hasNext())
    {
      Iterator localIterator2 = ((Set)localIterator1.next()).iterator();
      while (localIterator2.hasNext()) {
        localArrayList.add(localIterator2.next());
      }
    }
    return localArrayList;
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.objects.SimpleMultiMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */