package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;

class WellBehavedMap$EntrySet$1
  extends TransformedIterator<K, Map.Entry<K, V>>
{
  WellBehavedMap$EntrySet$1(WellBehavedMap.EntrySet paramEntrySet, Iterator paramIterator)
  {
    super(paramIterator);
  }
  
  Map.Entry<K, V> transform(final K paramK)
  {
    new AbstractMapEntry()
    {
      public K getKey()
      {
        return (K)paramK;
      }
      
      public V getValue()
      {
        return (V)this$1.this$0.get(paramK);
      }
      
      public V setValue(V paramAnonymousV)
      {
        return (V)this$1.this$0.put(paramK, paramAnonymousV);
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.WellBehavedMap.EntrySet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */