package com.google.common.collect;

import com.google.common.annotations.Beta;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;

@Beta
public class ForwardingNavigableMap$StandardDescendingMap
  extends Maps.DescendingMap<K, V>
{
  public ForwardingNavigableMap$StandardDescendingMap(ForwardingNavigableMap paramForwardingNavigableMap) {}
  
  protected Iterator<Map.Entry<K, V>> entryIterator()
  {
    new Iterator()
    {
      private Map.Entry<K, V> nextOrNull = forward().lastEntry();
      private Map.Entry<K, V> toRemove = null;
      
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
          nextOrNull = forward().lowerEntry(nextOrNull.getKey());
        }
      }
      
      public void remove()
      {
        if (toRemove != null) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          forward().remove(toRemove.getKey());
          toRemove = null;
          return;
        }
      }
    };
  }
  
  NavigableMap<K, V> forward()
  {
    return this$0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ForwardingNavigableMap.StandardDescendingMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */