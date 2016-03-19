package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NoSuchElementException;

class LinkedHashMultimap$1
  implements Iterator<Map.Entry<K, V>>
{
  LinkedHashMultimap.ValueEntry<K, V> nextEntry = access$300this$0).successorInMultimap;
  LinkedHashMultimap.ValueEntry<K, V> toRemove;
  
  LinkedHashMultimap$1(LinkedHashMultimap paramLinkedHashMultimap) {}
  
  public boolean hasNext()
  {
    return nextEntry != LinkedHashMultimap.access$300(this$0);
  }
  
  public Map.Entry<K, V> next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    LinkedHashMultimap.ValueEntry localValueEntry = nextEntry;
    toRemove = localValueEntry;
    nextEntry = nextEntry.successorInMultimap;
    return localValueEntry;
  }
  
  public void remove()
  {
    if (toRemove != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      this$0.remove(toRemove.getKey(), toRemove.getValue());
      toRemove = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.LinkedHashMultimap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */