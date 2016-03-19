package com.google.common.collect;

import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;

class ForwardingNavigableMap$StandardDescendingMap$1
  implements Iterator<Map.Entry<K, V>>
{
  private Map.Entry<K, V> nextOrNull = this$1.forward().lastEntry();
  private Map.Entry<K, V> toRemove = null;
  
  ForwardingNavigableMap$StandardDescendingMap$1(ForwardingNavigableMap.StandardDescendingMap paramStandardDescendingMap) {}
  
  public boolean hasNext()
  {
    return nextOrNull != null;
  }
  
  public Map.Entry<K, V> next()
  {
    if (!hasNext()) {
      throw new NoSuchElementException();
    }
    try
    {
      Map.Entry localEntry = nextOrNull;
      return localEntry;
    }
    finally
    {
      toRemove = nextOrNull;
      nextOrNull = this$1.forward().lowerEntry(nextOrNull.getKey());
    }
  }
  
  public void remove()
  {
    if (toRemove != null) {}
    for (boolean bool = true;; bool = false)
    {
      CollectPreconditions.checkRemove(bool);
      this$1.forward().remove(toRemove.getKey());
      toRemove = null;
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ForwardingNavigableMap.StandardDescendingMap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */