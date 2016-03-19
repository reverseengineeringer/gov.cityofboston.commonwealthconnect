package com.google.common.collect;

import java.util.Comparator;

final class RegularImmutableTable$1
  implements Comparator<Table.Cell<R, C, V>>
{
  RegularImmutableTable$1(Comparator paramComparator1, Comparator paramComparator2) {}
  
  public int compare(Table.Cell<R, C, V> paramCell1, Table.Cell<R, C, V> paramCell2)
  {
    int j = 0;
    if (val$rowComparator == null) {}
    for (int i = 0; i != 0; i = val$rowComparator.compare(paramCell1.getRowKey(), paramCell2.getRowKey())) {
      return i;
    }
    if (val$columnComparator == null) {}
    for (i = j;; i = val$columnComparator.compare(paramCell1.getColumnKey(), paramCell2.getColumnKey())) {
      return i;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableTable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */