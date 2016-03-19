package com.google.common.collect;

import com.google.common.base.Function;

final class Tables$TransposeTable$1
  implements Function<Table.Cell<?, ?, ?>, Table.Cell<?, ?, ?>>
{
  public Table.Cell<?, ?, ?> apply(Table.Cell<?, ?, ?> paramCell)
  {
    return Tables.immutableCell(paramCell.getColumnKey(), paramCell.getRowKey(), paramCell.getValue());
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.TransposeTable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */