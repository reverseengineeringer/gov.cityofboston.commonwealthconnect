package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class WellBehavedMap$EntrySet
  extends Maps.EntrySet<K, V>
{
  private WellBehavedMap$EntrySet(WellBehavedMap paramWellBehavedMap) {}
  
  public Iterator<Map.Entry<K, V>> iterator()
  {
    new TransformedIterator(this$0.keySet().iterator())
    {
      Map.Entry<K, V> transform(final K paramAnonymousK)
      {
        new AbstractMapEntry()
        {
          public K getKey()
          {
            return (K)paramAnonymousK;
          }
          
          public V getValue()
          {
            return (V)this$0.get(paramAnonymousK);
          }
          
          public V setValue(V paramAnonymous2V)
          {
            return (V)this$0.put(paramAnonymousK, paramAnonymous2V);
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
 * Qualified Name:     com.google.common.collect.WellBehavedMap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */