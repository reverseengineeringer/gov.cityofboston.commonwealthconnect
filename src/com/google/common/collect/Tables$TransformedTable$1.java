package com.google.common.collect;

import com.google.common.base.Function;

class Tables$TransformedTable$1
  implements Function<Table.Cell<R, C, V1>, Table.Cell<R, C, V2>>
{
  Tables$TransformedTable$1(Tables.TransformedTable paramTransformedTable) {}
  
  public Table.Cell<R, C, V2> apply(Table.Cell<R, C, V1> paramCell)
  {
    return Tables.immutableCell(paramCell.getRowKey(), paramCell.getColumnKey(), this$0.function.apply(paramCell.getValue()));
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.TransformedTable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */