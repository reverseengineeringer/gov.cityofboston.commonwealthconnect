package com.google.common.collect;

import java.util.Map.Entry;

class ArrayTable$ArrayMap$1$1
  extends AbstractIndexedListIterator<Map.Entry<K, V>>
{
  ArrayTable$ArrayMap$1$1(ArrayTable.ArrayMap.1 param1, int paramInt)
  {
    super(paramInt);
  }
  
  protected Map.Entry<K, V> get(final int paramInt)
  {
    new AbstractMapEntry()
    {
      public K getKey()
      {
        return (K)this$1.this$0.getKey(paramInt);
      }
      
      public V getValue()
      {
        return (V)this$1.this$0.getValue(paramInt);
      }
      
      public V setValue(V paramAnonymousV)
      {
        return (V)this$1.this$0.setValue(paramInt, paramAnonymousV);
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.ArrayMap.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */