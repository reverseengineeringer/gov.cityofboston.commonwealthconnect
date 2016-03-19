package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.Map;

@GwtCompatible
class SingletonImmutableTable<R, C, V>
  extends ImmutableTable<R, C, V>
{
  final C singleColumnKey;
  final R singleRowKey;
  final V singleValue;
  
  SingletonImmutableTable(Table.Cell<R, C, V> paramCell)
  {
    this(paramCell.getRowKey(), paramCell.getColumnKey(), paramCell.getValue());
  }
  
  SingletonImmutableTable(R paramR, C paramC, V paramV)
  {
    singleRowKey = Preconditions.checkNotNull(paramR);
    singleColumnKey = Preconditions.checkNotNull(paramC);
    singleValue = Preconditions.checkNotNull(paramV);
  }
  
  public ImmutableMap<R, V> column(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    if (containsColumn(paramC)) {
      return ImmutableMap.of(singleRowKey, singleValue);
    }
    return ImmutableMap.of();
  }
  
  public ImmutableMap<C, Map<R, V>> columnMap()
  {
    return ImmutableMap.of(singleColumnKey, ImmutableMap.of(singleRowKey, singleValue));
  }
  
  ImmutableSet<Table.Cell<R, C, V>> createCellSet()
  {
    return ImmutableSet.of(cellOf(singleRowKey, singleColumnKey, singleValue));
  }
  
  ImmutableCollection<V> createValues()
  {
    return ImmutableSet.of(singleValue);
  }
  
  public ImmutableMap<R, Map<C, V>> rowMap()
  {
    return ImmutableMap.of(singleRowKey, ImmutableMap.of(singleColumnKey, singleValue));
  }
  
  public int size()
  {
    return 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.SingletonImmutableTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */