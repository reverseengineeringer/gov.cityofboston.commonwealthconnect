package com.google.common.collect;

import com.google.common.base.Function;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

class TreeBasedTable$1
  implements Function<Map<C, V>, Iterator<C>>
{
  TreeBasedTable$1(TreeBasedTable paramTreeBasedTable) {}
  
  public Iterator<C> apply(Map<C, V> paramMap)
  {
    return paramMap.keySet().iterator();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeBasedTable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */