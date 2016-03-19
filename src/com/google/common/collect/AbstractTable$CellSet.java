package com.google.common.collect;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.Nullable;

class AbstractTable$CellSet
  extends AbstractSet<Table.Cell<R, C, V>>
{
  AbstractTable$CellSet(AbstractTable paramAbstractTable) {}
  
  public void clear()
  {
    this$0.clear();
  }
  
  public boolean contains(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Table.Cell))
    {
      paramObject = (Table.Cell)paramObject;
      Map localMap = (Map)Maps.safeGet(this$0.rowMap(), ((Table.Cell)paramObject).getRowKey());
      bool1 = bool2;
      if (localMap != null)
      {
        bool1 = bool2;
        if (Collections2.safeContains(localMap.entrySet(), Maps.immutableEntry(((Table.Cell)paramObject).getColumnKey(), ((Table.Cell)paramObject).getValue()))) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public Iterator<Table.Cell<R, C, V>> iterator()
  {
    return this$0.cellIterator();
  }
  
  public boolean remove(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Table.Cell))
    {
      paramObject = (Table.Cell)paramObject;
      Map localMap = (Map)Maps.safeGet(this$0.rowMap(), ((Table.Cell)paramObject).getRowKey());
      bool1 = bool2;
      if (localMap != null)
      {
        bool1 = bool2;
        if (Collections2.safeRemove(localMap.entrySet(), Maps.immutableEntry(((Table.Cell)paramObject).getColumnKey(), ((Table.Cell)paramObject).getValue()))) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int size()
  {
    return this$0.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractTable.CellSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */