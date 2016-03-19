package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Map.Entry;

class StandardTable$Row$RowEntrySet$1$1
  extends ForwardingMapEntry<C, V>
{
  StandardTable$Row$RowEntrySet$1$1(StandardTable.Row.RowEntrySet.1 param1, Map.Entry paramEntry) {}
  
  protected Map.Entry<C, V> delegate()
  {
    return val$entry;
  }
  
  public boolean equals(Object paramObject)
  {
    return standardEquals(paramObject);
  }
  
  public V setValue(V paramV)
  {
    return (V)super.setValue(Preconditions.checkNotNull(paramV));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Row.RowEntrySet.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */