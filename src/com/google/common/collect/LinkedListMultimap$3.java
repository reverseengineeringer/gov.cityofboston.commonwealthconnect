package com.google.common.collect;

import java.util.AbstractSequentialList;
import java.util.ListIterator;
import java.util.Map.Entry;

class LinkedListMultimap$3
  extends AbstractSequentialList<V>
{
  LinkedListMultimap$3(LinkedListMultimap paramLinkedListMultimap) {}
  
  public ListIterator<V> listIterator(int paramInt)
  {
    final LinkedListMultimap.NodeIterator localNodeIterator = new LinkedListMultimap.NodeIterator(this$0, paramInt);
    new TransformedListIterator(localNodeIterator)
    {
      public void set(V paramAnonymousV)
      {
        localNodeIterator.setValue(paramAnonymousV);
      }
      
      V transform(Map.Entry<K, V> paramAnonymousEntry)
      {
        return (V)paramAnonymousEntry.getValue();
      }
    };
  }
  
  public int size()
  {
    return LinkedListMultimap.access$900(this$0);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedListMultimap.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */