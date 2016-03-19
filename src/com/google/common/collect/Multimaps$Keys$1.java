package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map.Entry;

class Multimaps$Keys$1
  extends TransformedIterator<Map.Entry<K, Collection<V>>, Multiset.Entry<K>>
{
  Multimaps$Keys$1(Multimaps.Keys paramKeys, Iterator paramIterator)
  {
    super(paramIterator);
  }
  
  Multiset.Entry<K> transform(final Map.Entry<K, Collection<V>> paramEntry)
  {
    new Multisets.AbstractEntry()
    {
      public int getCount()
      {
        return ((Collection)paramEntry.getValue()).size();
      }
      
      public K getElement()
      {
        return (K)paramEntry.getKey();
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.Keys.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */