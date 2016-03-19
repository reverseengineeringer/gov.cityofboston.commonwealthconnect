package com.google.common.collect;

import java.util.AbstractSequentialList;
import java.util.ListIterator;
import java.util.Map;

class LinkedListMultimap$1
  extends AbstractSequentialList<V>
{
  LinkedListMultimap$1(LinkedListMultimap paramLinkedListMultimap, Object paramObject) {}
  
  public ListIterator<V> listIterator(int paramInt)
  {
    return new LinkedListMultimap.ValueForKeyIterator(this$0, val$key, paramInt);
  }
  
  public int size()
  {
    LinkedListMultimap.KeyList localKeyList = (LinkedListMultimap.KeyList)LinkedListMultimap.access$600(this$0).get(val$key);
    if (localKeyList == null) {
      return 0;
    }
    return count;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */