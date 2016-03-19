package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

class AbstractNavigableMap$1
  extends Maps.EntrySet<K, V>
{
  AbstractNavigableMap$1(AbstractNavigableMap paramAbstractNavigableMap) {}
  
  public Iterator<Map.Entry<K, V>> iterator()
  {
    return this$0.entryIterator();
  }
  
  Map<K, V> map()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractNavigableMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */