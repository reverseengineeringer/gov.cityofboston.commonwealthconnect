package com.google.common.cache;

import java.util.Map.Entry;
import javax.annotation.Nullable;

final class LocalCache$WriteThroughEntry
  implements Map.Entry<K, V>
{
  final K key;
  V value;
  
  LocalCache$WriteThroughEntry(K paramK, V paramV)
  {
    key = paramV;
    Object localObject;
    value = localObject;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      bool1 = bool2;
      if (key.equals(((Map.Entry)paramObject).getKey()))
      {
        bool1 = bool2;
        if (value.equals(((Map.Entry)paramObject).getValue())) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public K getKey()
  {
    return (K)key;
  }
  
  public V getValue()
  {
    return (V)value;
  }
  
  public int hashCode()
  {
    return key.hashCode() ^ value.hashCode();
  }
  
  public V setValue(V paramV)
  {
    throw new UnsupportedOperationException();
  }
  
  public String toString()
  {
    return getKey() + "=" + getValue();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WriteThroughEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */