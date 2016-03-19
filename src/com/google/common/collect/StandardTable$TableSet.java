package com.google.common.collect;

import java.util.Map;

abstract class StandardTable$TableSet<T>
  extends Sets.ImprovedAbstractSet<T>
{
  private StandardTable$TableSet(StandardTable paramStandardTable) {}
  
  public void clear()
  {
    this$0.backingMap.clear();
  }
  
  public boolean isEmpty()
  {
    return this$0.backingMap.isEmpty();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.StandardTable.TableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */