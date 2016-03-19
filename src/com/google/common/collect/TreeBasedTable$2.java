package com.google.common.collect;

import java.util.Comparator;
import java.util.Iterator;

class TreeBasedTable$2
  extends AbstractIterator<C>
{
  C lastValue;
  
  TreeBasedTable$2(TreeBasedTable paramTreeBasedTable, Iterator paramIterator, Comparator paramComparator) {}
  
  protected C computeNext()
  {
    if (val$merged.hasNext())
    {
      Object localObject = val$merged.next();
      if ((lastValue != null) && (val$comparator.compare(localObject, lastValue) == 0)) {}
      for (int i = 1; i == 0; i = 0)
      {
        lastValue = localObject;
        return (C)lastValue;
      }
    }
    lastValue = null;
    return (C)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeBasedTable.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */