package com.google.common.collect;

import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Comparator;
import java.util.TreeMap;

class TreeBasedTable$Factory<C, V>
  implements Supplier<TreeMap<C, V>>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Comparator<? super C> comparator;
  
  TreeBasedTable$Factory(Comparator<? super C> paramComparator)
  {
    comparator = paramComparator;
  }
  
  public TreeMap<C, V> get()
  {
    return new TreeMap(comparator);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeBasedTable.Factory
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */