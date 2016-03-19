package com.google.common.collect;

import java.util.Map;

class ArrayTable$ColumnMap
  extends ArrayTable.ArrayMap<C, Map<R, V>>
{
  private ArrayTable$ColumnMap(ArrayTable paramArrayTable)
  {
    super(ArrayTable.access$500(paramArrayTable), null);
  }
  
  String getKeyRole()
  {
    return "Column";
  }
  
  Map<R, V> getValue(int paramInt)
  {
    return new ArrayTable.Column(this$0, paramInt);
  }
  
  public Map<R, V> put(C paramC, Map<R, V> paramMap)
  {
    throw new UnsupportedOperationException();
  }
  
  Map<R, V> setValue(int paramInt, Map<R, V> paramMap)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ArrayTable.ColumnMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */