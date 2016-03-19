package com.google.common.collect;

import java.util.ListIterator;
import java.util.Map.Entry;

class LinkedListMultimap$3$1
  extends TransformedListIterator<Map.Entry<K, V>, V>
{
  LinkedListMultimap$3$1(LinkedListMultimap.3 param3, ListIterator paramListIterator, LinkedListMultimap.NodeIterator paramNodeIterator)
  {
    super(paramListIterator);
  }
  
  public void set(V paramV)
  {
    val$nodeItr.setValue(paramV);
  }
  
  V transform(Map.Entry<K, V> paramEntry)
  {
    return (V)paramEntry.getValue();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.3.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */