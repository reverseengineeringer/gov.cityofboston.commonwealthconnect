package com.google.common.collect;

import java.util.Map.Entry;

class DenseImmutableTable$ImmutableArrayMap$1$1
  extends AbstractIterator<Map.Entry<K, V>>
{
  private int index = -1;
  private final int maxIndex = this$1.this$0.keyToIndex().size();
  
  DenseImmutableTable$ImmutableArrayMap$1$1(DenseImmutableTable.ImmutableArrayMap.1 param1) {}
  
  protected Map.Entry<K, V> computeNext()
  {
    for (index += 1; index < maxIndex; index += 1)
    {
      Object localObject = this$1.this$0.getValue(index);
      if (localObject != null) {
        return Maps.immutableEntry(this$1.this$0.getKey(index), localObject);
      }
    }
    return (Map.Entry)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.DenseImmutableTable.ImmutableArrayMap.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */