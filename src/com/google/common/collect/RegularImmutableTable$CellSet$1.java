package com.google.common.collect;

class RegularImmutableTable$CellSet$1
  extends ImmutableAsList<Table.Cell<R, C, V>>
{
  RegularImmutableTable$CellSet$1(RegularImmutableTable.CellSet paramCellSet) {}
  
  ImmutableCollection<Table.Cell<R, C, V>> delegateCollection()
  {
    return this$1;
  }
  
  public Table.Cell<R, C, V> get(int paramInt)
  {
    return this$1.this$0.getCell(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableTable.CellSet.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */