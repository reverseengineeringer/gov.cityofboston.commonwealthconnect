package com.google.common.collect;

import java.util.Map.Entry;
import javax.annotation.Nullable;

abstract class DenseImmutableTable$ImmutableArrayMap<K, V>
  extends ImmutableMap<K, V>
{
  private final int size;
  
  DenseImmutableTable$ImmutableArrayMap(int paramInt)
  {
    size = paramInt;
  }
  
  private boolean isFull()
  {
    return size == keyToIndex().size();
  }
  
  ImmutableSet<Map.Entry<K, V>> createEntrySet()
  {
    new ImmutableMapEntrySet()
    {
      public UnmodifiableIterator<Map.Entry<K, V>> iterator()
      {
        new AbstractIterator()
        {
          private int index = -1;
          private final int maxIndex = keyToIndex().size();
          
          protected Map.Entry<K, V> computeNext()
          {
            for (index += 1; index < maxIndex; index += 1)
            {
              Object localObject = getValue(index);
              if (localObject != null) {
                return Maps.immutableEntry(getKey(index), localObject);
              }
            }
            return (Map.Entry)endOfData();
          }
        };
      }
      
      ImmutableMap<K, V> map()
      {
        return DenseImmutableTable.ImmutableArrayMap.this;
      }
    };
  }
  
  ImmutableSet<K> createKeySet()
  {
    if (isFull()) {
      return keyToIndex().keySet();
    }
    return super.createKeySet();
  }
  
  public V get(@Nullable Object paramObject)
  {
    paramObject = (Integer)keyToIndex().get(paramObject);
    if (paramObject == null) {
      return null;
    }
    return (V)getValue(((Integer)paramObject).intValue());
  }
  
  K getKey(int paramInt)
  {
    return (K)keyToIndex().keySet().asList().get(paramInt);
  }
  
  @Nullable
  abstract V getValue(int paramInt);
  
  abstract ImmutableMap<K, Integer> keyToIndex();
  
  public int size()
  {
    return size;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DenseImmutableTable.ImmutableArrayMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */