package com.google.common.collect;

import com.google.common.base.Predicates;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class StandardTable$Column$EntrySet
  extends Sets.ImprovedAbstractSet<Map.Entry<R, V>>
{
  private StandardTable$Column$EntrySet(StandardTable.Column paramColumn) {}
  
  public void clear()
  {
    this$1.removeFromColumnIf(Predicates.alwaysTrue());
  }
  
  public boolean contains(Object paramObject)
  {
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      return StandardTable.access$400(this$1.this$0, ((Map.Entry)paramObject).getKey(), this$1.columnKey, ((Map.Entry)paramObject).getValue());
    }
    return false;
  }
  
  public boolean isEmpty()
  {
    return !this$1.this$0.containsColumn(this$1.columnKey);
  }
  
  public Iterator<Map.Entry<R, V>> iterator()
  {
    return new StandardTable.Column.EntrySetIterator(this$1, null);
  }
  
  public boolean remove(Object paramObject)
  {
    if ((paramObject instanceof Map.Entry))
    {
      paramObject = (Map.Entry)paramObject;
      return StandardTable.access$500(this$1.this$0, ((Map.Entry)paramObject).getKey(), this$1.columnKey, ((Map.Entry)paramObject).getValue());
    }
    return false;
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    return this$1.removeFromColumnIf(Predicates.not(Predicates.in(paramCollection)));
  }
  
  public int size()
  {
    int i = 0;
    Iterator localIterator = this$1.this$0.backingMap.values().iterator();
    while (localIterator.hasNext()) {
      if (((Map)localIterator.next()).containsKey(this$1.columnKey)) {
        i += 1;
      }
    }
    return i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.Column.EntrySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */