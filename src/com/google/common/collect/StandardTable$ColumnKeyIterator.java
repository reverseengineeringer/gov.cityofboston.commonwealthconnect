package com.google.common.collect;

import com.google.common.base.Supplier;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$ColumnKeyIterator
  extends AbstractIterator<C>
{
  Iterator<Map.Entry<C, V>> entryIterator = Iterators.emptyIterator();
  final Iterator<Map<C, V>> mapIterator = this$0.backingMap.values().iterator();
  final Map<C, V> seen = (Map)this$0.factory.get();
  
  private StandardTable$ColumnKeyIterator(StandardTable paramStandardTable) {}
  
  protected C computeNext()
  {
    for (;;)
    {
      if (entryIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)entryIterator.next();
        if (!seen.containsKey(localEntry.getKey()))
        {
          seen.put(localEntry.getKey(), localEntry.getValue());
          return (C)localEntry.getKey();
        }
      }
      else
      {
        if (!mapIterator.hasNext()) {
          break;
        }
        entryIterator = ((Map)mapIterator.next()).entrySet().iterator();
      }
    }
    return (C)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.ColumnKeyIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */