package com.google.common.collect;

class ArrayTable$Row
  extends ArrayTable.ArrayMap<C, V>
{
  final int rowIndex;
  
  ArrayTable$Row(ArrayTable paramArrayTable, int paramInt)
  {
    super(ArrayTable.access$500(paramArrayTable), null);
    rowIndex = paramInt;
  }
  
  String getKeyRole()
  {
    return "Column";
  }
  
  V getValue(int paramInt)
  {
    return (V)this$0.at(rowIndex, paramInt);
  }
  
  V setValue(int paramInt, V paramV)
  {
    return (V)this$0.set(rowIndex, paramInt, paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.Row
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */