package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$RowMap
  extends Maps.ImprovedAbstractMap<R, Map<C, V>>
{
  StandardTable$RowMap(StandardTable paramStandardTable) {}
  
  public boolean containsKey(Object paramObject)
  {
    return this$0.containsRow(paramObject);
  }
  
  protected Set<Map.Entry<R, Map<C, V>>> createEntrySet()
  {
    return new EntrySet();
  }
  
  public Map<C, V> get(Object paramObject)
  {
    if (this$0.containsRow(paramObject)) {
      return this$0.row(paramObject);
    }
    return null;
  }
  
  public Map<C, V> remove(Object paramObject)
  {
    if (paramObject == null) {
      return null;
    }
    return (Map)this$0.backingMap.remove(paramObject);
  }
  
  class EntrySet
    extends StandardTable<R, C, V>.TableSet<Map.Entry<R, Map<C, V>>>
  {
    EntrySet()
    {
      super(null);
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
            if (Collections2.safeContains(this$0.backingMap.entrySet(), paramObject)) {
              bool1 = true;
            }
          }
        }
      }
      return bool1;
    }
    
    public Iterator<Map.Entry<R, Map<C, V>>> iterator()
    {
      Maps.asMapEntryIterator(this$0.backingMap.keySet(), new Function()
      {
        public Map<C, V> apply(R paramAnonymousR)
        {
          return this$0.row(paramAnonymousR);
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
            if (this$0.backingMap.entrySet().remove(paramObject)) {
              bool1 = true;
            }
          }
        }
      }
      return bool1;
    }
    
    public int size()
    {
      return this$0.backingMap.size();
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.RowMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */