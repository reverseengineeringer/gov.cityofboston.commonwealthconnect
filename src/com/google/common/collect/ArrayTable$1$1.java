package com.google.common.collect;

class ArrayTable$1$1
  extends Tables.AbstractCell<R, C, V>
{
  final int columnIndex = val$index % ArrayTable.access$000(this$1.this$0).size();
  final int rowIndex = val$index / ArrayTable.access$000(this$1.this$0).size();
  
  ArrayTable$1$1(ArrayTable.1 param1, int paramInt) {}
  
  public C getColumnKey()
  {
    return (C)ArrayTable.access$000(this$1.this$0).get(columnIndex);
  }
  
  public R getRowKey()
  {
    return (R)ArrayTable.access$100(this$1.this$0).get(rowIndex);
  }
  
  public V getValue()
  {
    return (V)this$1.this$0.at(rowIndex, columnIndex);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */