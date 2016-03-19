package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class StandardTable$ColumnKeySet
  extends StandardTable<R, C, V>.TableSet<C>
{
  private StandardTable$ColumnKeySet(StandardTable paramStandardTable)
  {
    super(paramStandardTable, null);
  }
  
  public boolean contains(Object paramObject)
  {
    return this$0.containsColumn(paramObject);
  }
  
  public Iterator<C> iterator()
  {
    return this$0.createColumnKeyIterator();
  }
  
  public boolean remove(Object paramObject)
  {
    boolean bool2;
    if (paramObject == null)
    {
      bool2 = false;
      return bool2;
    }
    boolean bool1 = false;
    Iterator localIterator = this$0.backingMap.values().iterator();
    for (;;)
    {
      bool2 = bool1;
      if (!localIterator.hasNext()) {
        break;
      }
      Map localMap = (Map)localIterator.next();
      if (localMap.keySet().remove(paramObject))
      {
        bool2 = true;
        bool1 = bool2;
        if (localMap.isEmpty())
        {
          localIterator.remove();
          bool1 = bool2;
        }
      }
    }
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    boolean bool1 = false;
    Iterator localIterator = this$0.backingMap.values().iterator();
    while (localIterator.hasNext())
    {
      Map localMap = (Map)localIterator.next();
      if (Iterators.removeAll(localMap.keySet().iterator(), paramCollection))
      {
        boolean bool2 = true;
        bool1 = bool2;
        if (localMap.isEmpty())
        {
          localIterator.remove();
          bool1 = bool2;
        }
      }
    }
    return bool1;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    Preconditions.checkNotNull(paramCollection);
    boolean bool1 = false;
    Iterator localIterator = this$0.backingMap.values().iterator();
    while (localIterator.hasNext())
    {
      Map localMap = (Map)localIterator.next();
      if (localMap.keySet().retainAll(paramCollection))
      {
        boolean bool2 = true;
        bool1 = bool2;
        if (localMap.isEmpty())
        {
          localIterator.remove();
          bool1 = bool2;
        }
      }
    }
    return bool1;
  }
  
  public int size()
  {
    return Iterators.size(iterator());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.ColumnKeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */