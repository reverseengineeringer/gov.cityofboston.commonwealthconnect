package com.google.common.collect;

import java.util.Iterator;

class AbstractTable$1
  extends TransformedIterator<Table.Cell<R, C, V>, V>
{
  AbstractTable$1(AbstractTable paramAbstractTable, Iterator paramIterator)
  {
    super(paramIterator);
  }
  
  V transform(Table.Cell<R, C, V> paramCell)
  {
    return (V)paramCell.getValue();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractTable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */