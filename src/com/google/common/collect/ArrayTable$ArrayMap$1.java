package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class ArrayTable$ArrayMap$1
  extends Maps.EntrySet<K, V>
{
  ArrayTable$ArrayMap$1(ArrayTable.ArrayMap paramArrayMap) {}
  
  public Iterator<Map.Entry<K, V>> iterator()
  {
    new AbstractIndexedListIterator(size())
    {
      protected Map.Entry<K, V> get(final int paramAnonymousInt)
      {
        new AbstractMapEntry()
        {
          public K getKey()
          {
            return (K)this$0.getKey(paramAnonymousInt);
          }
          
          public V getValue()
          {
            return (V)this$0.getValue(paramAnonymousInt);
          }
          
          public V setValue(V paramAnonymous2V)
          {
            return (V)this$0.setValue(paramAnonymousInt, paramAnonymous2V);
          }
        };
      }
    };
  }
  
  Map<K, V> map()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.ArrayMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */