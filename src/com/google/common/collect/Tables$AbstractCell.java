package com.google.common.collect;

import com.google.common.base.Objects;

abstract class Tables$AbstractCell<R, C, V>
  implements Table.Cell<R, C, V>
{
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {}
    do
    {
      return true;
      if (!(paramObject instanceof Table.Cell)) {
        break;
      }
      paramObject = (Table.Cell)paramObject;
    } while ((Objects.equal(getRowKey(), ((Table.Cell)paramObject).getRowKey())) && (Objects.equal(getColumnKey(), ((Table.Cell)paramObject).getColumnKey())) && (Objects.equal(getValue(), ((Table.Cell)paramObject).getValue())));
    return false;
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { getRowKey(), getColumnKey(), getValue() });
  }
  
  public String toString()
  {
    return "(" + getRowKey() + "," + getColumnKey() + ")=" + getValue();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Tables.AbstractCell
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */