package com.google.common.collect;

class ArrayTable$Column
  extends ArrayTable.ArrayMap<R, V>
{
  final int columnIndex;
  
  ArrayTable$Column(ArrayTable paramArrayTable, int paramInt)
  {
    super(ArrayTable.access$200(paramArrayTable), null);
    columnIndex = paramInt;
  }
  
  String getKeyRole()
  {
    return "Row";
  }
  
  V getValue(int paramInt)
  {
    return (V)this$0.at(paramInt, columnIndex);
  }
  
  V setValue(int paramInt, V paramV)
  {
    return (V)this$0.set(paramInt, columnIndex, paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.Column
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */