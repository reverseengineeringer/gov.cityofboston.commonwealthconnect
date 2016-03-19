package com.google.common.collect;

import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class StandardTable$ColumnMap
  extends Maps.ImprovedAbstractMap<C, Map<R, V>>
{
  private StandardTable$ColumnMap(StandardTable paramStandardTable) {}
  
  public boolean containsKey(Object paramObject)
  {
    return this$0.containsColumn(paramObject);
  }
  
  public Set<Map.Entry<C, Map<R, V>>> createEntrySet()
  {
    return new ColumnMapEntrySet();
  }
  
  Collection<Map<R, V>> createValues()
  {
    return new ColumnMapValues();
  }
  
  public Map<R, V> get(Object paramObject)
  {
    if (this$0.containsColumn(paramObject)) {
      return this$0.column(paramObject);
    }
    return null;
  }
  
  public Set<C> keySet()
  {
    return this$0.columnKeySet();
  }
  
  public Map<R, V> remove(Object paramObject)
  {
    if (this$0.containsColumn(paramObject)) {
      return StandardTable.access$1000(this$0, paramObject);
    }
    return null;
  }
  
  class ColumnMapEntrySet
    extends StandardTable<R, C, V>.TableSet<Map.Entry<C, Map<R, V>>>
  {
    ColumnMapEntrySet()
    {
      super(null);
    }
    
    public boolean contains(Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        paramObject = (Map.Entry)paramObject;
        if (this$0.containsColumn(((Map.Entry)paramObject).getKey()))
        {
          Object localObject = ((Map.Entry)paramObject).getKey();
          return get(localObject).equals(((Map.Entry)paramObject).getValue());
        }
      }
      return false;
    }
    
    public Iterator<Map.Entry<C, Map<R, V>>> iterator()
    {
      Maps.asMapEntryIterator(this$0.columnKeySet(), new Function()
      {
        public Map<R, V> apply(C paramAnonymousC)
        {
          return this$0.column(paramAnonymousC);
        }
      });
    }
    
    public boolean remove(Object paramObject)
    {
      if (contains(paramObject))
      {
        paramObject = (Map.Entry)paramObject;
        StandardTable.access$1000(this$0, ((Map.Entry)paramObject).getKey());
        return true;
      }
      return false;
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      Preconditions.checkNotNull(paramCollection);
      return Sets.removeAllImpl(this, paramCollection.iterator());
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      Preconditions.checkNotNull(paramCollection);
      boolean bool = false;
      Iterator localIterator = Lists.newArrayList(this$0.columnKeySet().iterator()).iterator();
      while (localIterator.hasNext())
      {
        Object localObject = localIterator.next();
        if (!paramCollection.contains(Maps.immutableEntry(localObject, this$0.column(localObject))))
        {
          StandardTable.access$1000(this$0, localObject);
          bool = true;
        }
      }
      return bool;
    }
    
    public int size()
    {
      return this$0.columnKeySet().size();
    }
  }
  
  private class ColumnMapValues
    extends Maps.Values<C, Map<R, V>>
  {
    ColumnMapValues()
    {
      super();
    }
    
    public boolean remove(Object paramObject)
    {
      Iterator localIterator = entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        if (((Map)localEntry.getValue()).equals(paramObject))
        {
          StandardTable.access$1000(this$0, localEntry.getKey());
          return true;
        }
      }
      return false;
    }
    
    public boolean removeAll(Collection<?> paramCollection)
    {
      Preconditions.checkNotNull(paramCollection);
      boolean bool = false;
      Iterator localIterator = Lists.newArrayList(this$0.columnKeySet().iterator()).iterator();
      while (localIterator.hasNext())
      {
        Object localObject = localIterator.next();
        if (paramCollection.contains(this$0.column(localObject)))
        {
          StandardTable.access$1000(this$0, localObject);
          bool = true;
        }
      }
      return bool;
    }
    
    public boolean retainAll(Collection<?> paramCollection)
    {
      Preconditions.checkNotNull(paramCollection);
      boolean bool = false;
      Iterator localIterator = Lists.newArrayList(this$0.columnKeySet().iterator()).iterator();
      while (localIterator.hasNext())
      {
        Object localObject = localIterator.next();
        if (!paramCollection.contains(this$0.column(localObject)))
        {
          StandardTable.access$1000(this$0, localObject);
          bool = true;
        }
      }
      return bool;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.ColumnMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */