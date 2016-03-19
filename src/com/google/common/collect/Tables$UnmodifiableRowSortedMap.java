package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Collections;
import java.util.Map;
import java.util.SortedMap;
import java.util.SortedSet;

final class Tables$UnmodifiableRowSortedMap<R, C, V>
  extends Tables.UnmodifiableTable<R, C, V>
  implements RowSortedTable<R, C, V>
{
  private static final long serialVersionUID = 0L;
  
  public Tables$UnmodifiableRowSortedMap(RowSortedTable<R, ? extends C, ? extends V> paramRowSortedTable)
  {
    super(paramRowSortedTable);
  }
  
  protected RowSortedTable<R, C, V> delegate()
  {
    return (RowSortedTable)super.delegate();
  }
  
  public SortedSet<R> rowKeySet()
  {
    return Collections.unmodifiableSortedSet(delegate().rowKeySet());
  }
  
  public SortedMap<R, Map<C, V>> rowMap()
  {
    Function localFunction = Tables.access$000();
    return Collections.unmodifiableSortedMap(Maps.transformValues(delegate().rowMap(), localFunction));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.UnmodifiableRowSortedMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */