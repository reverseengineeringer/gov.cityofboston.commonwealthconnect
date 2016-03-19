package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$RowMap$EntrySet
  extends StandardTable<R, C, V>.TableSet<Map.Entry<R, Map<C, V>>>
{
  StandardTable$RowMap$EntrySet(StandardTable.RowMap paramRowMap)
  {
    super(this$0, null);
  }
  
  public boolean contains(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      bool1 = bool2;
      if (((Map.Entry)paramObject).getKey() != null)
      {
        bool1 = bool2;
        if ((((Map.Entry)paramObject).getValue() instanceof Map))
        {
          bool1 = bool2;
          if (Collections2.safeContains(this$1.this$0.backingMap.entrySet(), paramObject)) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  public Iterator<Map.Entry<R, Map<C, V>>> iterator()
  {
    Maps.asMapEntryIterator(this$1.this$0.backingMap.keySet(), new Function()
    {
      public Map<C, V> apply(R paramAnonymousR)
      {
        return this$1.this$0.row(paramAnonymousR);
      }
    });
  }
  
  public boolean remove(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      bool1 = bool2;
      if (((Map.Entry)paramObject).getKey() != null)
      {
        bool1 = bool2;
        if ((((Map.Entry)paramObject).getValue() instanceof Map))
        {
          bool1 = bool2;
          if (this$1.this$0.backingMap.entrySet().remove(paramObject)) {
            bool1 = true;
          }
        }
      }
    }
    return bool1;
  }
  
  public int size()
  {
    return this$1.this$0.backingMap.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.RowMap.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */