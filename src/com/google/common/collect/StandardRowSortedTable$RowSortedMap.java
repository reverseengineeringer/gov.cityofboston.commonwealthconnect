package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Map;
import java.util.SortedMap;
import java.util.SortedSet;

class StandardRowSortedTable$RowSortedMap
  extends StandardTable<R, C, V>.RowMap
  implements SortedMap<R, Map<C, V>>
{
  private StandardRowSortedTable$RowSortedMap(StandardRowSortedTable paramStandardRowSortedTable)
  {
    super(paramStandardRowSortedTable);
  }
  
  public Comparator<? super R> comparator()
  {
    return StandardRowSortedTable.access$100(this$0).comparator();
  }
  
  SortedSet<R> createKeySet()
  {
    return new Maps.SortedKeySet(this);
  }
  
  public R firstKey()
  {
    return (R)StandardRowSortedTable.access$100(this$0).firstKey();
  }
  
  public SortedMap<R, Map<C, V>> headMap(R paramR)
  {
    Preconditions.checkNotNull(paramR);
    return new StandardRowSortedTable(StandardRowSortedTable.access$100(this$0).headMap(paramR), this$0.factory).rowMap();
  }
  
  public SortedSet<R> keySet()
  {
    return (SortedSet)super.keySet();
  }
  
  public R lastKey()
  {
    return (R)StandardRowSortedTable.access$100(this$0).lastKey();
  }
  
  public SortedMap<R, Map<C, V>> subMap(R paramR1, R paramR2)
  {
    Preconditions.checkNotNull(paramR1);
    Preconditions.checkNotNull(paramR2);
    return new StandardRowSortedTable(StandardRowSortedTable.access$100(this$0).subMap(paramR1, paramR2), this$0.factory).rowMap();
  }
  
  public SortedMap<R, Map<C, V>> tailMap(R paramR)
  {
    Preconditions.checkNotNull(paramR);
    return new StandardRowSortedTable(StandardRowSortedTable.access$100(this$0).tailMap(paramR), this$0.factory).rowMap();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardRowSortedTable.RowSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */