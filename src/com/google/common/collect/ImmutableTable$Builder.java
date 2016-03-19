package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public final class ImmutableTable$Builder<R, C, V>
{
  private final List<Table.Cell<R, C, V>> cells = Lists.newArrayList();
  private Comparator<? super C> columnComparator;
  private Comparator<? super R> rowComparator;
  
  public ImmutableTable<R, C, V> build()
  {
    switch (cells.size())
    {
    default: 
      return RegularImmutableTable.forCells(cells, rowComparator, columnComparator);
    case 0: 
      return ImmutableTable.of();
    }
    return new SingletonImmutableTable((Table.Cell)Iterables.getOnlyElement(cells));
  }
  
  public Builder<R, C, V> orderColumnsBy(Comparator<? super C> paramComparator)
  {
    columnComparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    return this;
  }
  
  public Builder<R, C, V> orderRowsBy(Comparator<? super R> paramComparator)
  {
    rowComparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
    return this;
  }
  
  public Builder<R, C, V> put(Table.Cell<? extends R, ? extends C, ? extends V> paramCell)
  {
    if ((paramCell instanceof Tables.ImmutableCell))
    {
      Preconditions.checkNotNull(paramCell.getRowKey());
      Preconditions.checkNotNull(paramCell.getColumnKey());
      Preconditions.checkNotNull(paramCell.getValue());
      cells.add(paramCell);
      return this;
    }
    put(paramCell.getRowKey(), paramCell.getColumnKey(), paramCell.getValue());
    return this;
  }
  
  public Builder<R, C, V> put(R paramR, C paramC, V paramV)
  {
    cells.add(ImmutableTable.cellOf(paramR, paramC, paramV));
    return this;
  }
  
  public Builder<R, C, V> putAll(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    paramTable = paramTable.cellSet().iterator();
    while (paramTable.hasNext()) {
      put((Table.Cell)paramTable.next());
    }
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableTable.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */