package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;

final class AbstractNavigableMap$DescendingMap
  extends Maps.DescendingMap<K, V>
{
  private AbstractNavigableMap$DescendingMap(AbstractNavigableMap paramAbstractNavigableMap) {}
  
  Iterator<Map.Entry<K, V>> entryIterator()
  {
    return this$0.descendingEntryIterator();
  }
  
  NavigableMap<K, V> forward()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractNavigableMap.DescendingMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */