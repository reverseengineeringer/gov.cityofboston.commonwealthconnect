package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

abstract class ArrayTable$ArrayMap<K, V>
  extends Maps.ImprovedAbstractMap<K, V>
{
  private final ImmutableMap<K, Integer> keyIndex;
  
  private ArrayTable$ArrayMap(ImmutableMap<K, Integer> paramImmutableMap)
  {
    keyIndex = paramImmutableMap;
  }
  
  public void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean containsKey(@Nullable Object paramObject)
  {
    return keyIndex.containsKey(paramObject);
  }
  
  protected Set<Map.Entry<K, V>> createEntrySet()
  {
    new Maps.EntrySet()
    {
      public Iterator<Map.Entry<K, V>> iterator()
      {
        new AbstractIndexedListIterator(size())
        {
          protected Map.Entry<K, V> get(final int paramAnonymous2Int)
          {
            new AbstractMapEntry()
            {
              public K getKey()
              {
                return (K)getKey(paramAnonymous2Int);
              }
              
              public V getValue()
              {
                return (V)getValue(paramAnonymous2Int);
              }
              
              public V setValue(V paramAnonymous3V)
              {
                return (V)setValue(paramAnonymous2Int, paramAnonymous3V);
              }
            };
          }
        };
      }
      
      Map<K, V> map()
      {
        return ArrayTable.ArrayMap.this;
      }
    };
  }
  
  public V get(@Nullable Object paramObject)
  {
    paramObject = (Integer)keyIndex.get(paramObject);
    if (paramObject == null) {
      return null;
    }
    return (V)getValue(((Integer)paramObject).intValue());
  }
  
  K getKey(int paramInt)
  {
    return (K)keyIndex.keySet().asList().get(paramInt);
  }
  
  abstract String getKeyRole();
  
  @Nullable
  abstract V getValue(int paramInt);
  
  public boolean isEmpty()
  {
    return keyIndex.isEmpty();
  }
  
  public Set<K> keySet()
  {
    return keyIndex.keySet();
  }
  
  public V put(K paramK, V paramV)
  {
    Integer localInteger = (Integer)keyIndex.get(paramK);
    if (localInteger == null) {
      throw new IllegalArgumentException(getKeyRole() + " " + paramK + " not in " + keyIndex.keySet());
    }
    return (V)setValue(localInteger.intValue(), paramV);
  }
  
  public V remove(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  @Nullable
  abstract V setValue(int paramInt, V paramV);
  
  public int size()
  {
    return keyIndex.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.ArrayMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */