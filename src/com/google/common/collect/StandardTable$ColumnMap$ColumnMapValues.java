package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$ColumnMap$ColumnMapValues
  extends Maps.Values<C, Map<R, V>>
{
  StandardTable$ColumnMap$ColumnMapValues(StandardTable.ColumnMap paramColumnMap)
  {
    super(paramColumnMap);
  }
  
  public boolean remove(Object paramObject)
  {
    Iterator localIterator = this$1.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      if (((Map)localEntry.getValue()).equals(paramObject))
      {
        StandardTable.access$1000(this$1.this$0, localEntry.getKey());
        return true;
      }
    }
    return false;
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    boolean bool = false;
    Iterator localIterator = Lists.newArrayList(this$1.this$0.columnKeySet().iterator()).iterator();
    while (localIterator.hasNext())
    {
      Object localObject = localIterator.next();
      if (paramCollection.contains(this$1.this$0.column(localObject)))
      {
        StandardTable.access$1000(this$1.this$0, localObject);
        bool = true;
      }
    }
    return bool;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    boolean bool = false;
    Iterator localIterator = Lists.newArrayList(this$1.this$0.columnKeySet().iterator()).iterator();
    while (localIterator.hasNext())
    {
      Object localObject = localIterator.next();
      if (!paramCollection.contains(this$1.this$0.column(localObject)))
      {
        StandardTable.access$1000(this$1.this$0, localObject);
        bool = true;
      }
    }
    return bool;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.ColumnMap.ColumnMapValues
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */