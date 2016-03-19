package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

final class StandardTable$Row$RowEntrySet
  extends Maps.EntrySet<C, V>
{
  private StandardTable$Row$RowEntrySet(StandardTable.Row paramRow) {}
  
  public Iterator<Map.Entry<C, V>> iterator()
  {
    Map localMap = this$1.backingRowMap();
    if (localMap == null) {
      return Iterators.emptyModifiableIterator();
    }
    new Iterator()
    {
      public boolean hasNext()
      {
        return val$iterator.hasNext();
      }
      
      public Map.Entry<C, V> next()
      {
        new ForwardingMapEntry()
        {
          protected Map.Entry<C, V> delegate()
          {
            return val$entry;
          }
          
          public boolean equals(Object paramAnonymous2Object)
          {
            return standardEquals(paramAnonymous2Object);
          }
          
          public V setValue(V paramAnonymous2V)
          {
            return (V)super.setValue(Preconditions.checkNotNull(paramAnonymous2V));
          }
        };
      }
      
      public void remove()
      {
        val$iterator.remove();
        this$1.maintainEmptyInvariant();
      }
    };
  }
  
  Map<C, V> map()
  {
    return this$1;
  }
  
  public int size()
  {
    Map localMap = this$1.backingRowMap();
    if (localMap == null) {
      return 0;
    }
    return localMap.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Row.RowEntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */