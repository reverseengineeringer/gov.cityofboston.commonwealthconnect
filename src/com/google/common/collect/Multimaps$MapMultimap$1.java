package com.google.common.collect;

import java.util.Iterator;
import java.util.Map;
import java.util.NoSuchElementException;

class Multimaps$MapMultimap$1
  extends Sets.ImprovedAbstractSet<V>
{
  Multimaps$MapMultimap$1(Multimaps.MapMultimap paramMapMultimap, Object paramObject) {}
  
  public Iterator<V> iterator()
  {
    new Iterator()
    {
      int i;
      
      public boolean hasNext()
      {
        return (i == 0) && (this$0.map.containsKey(val$key));
      }
      
      public V next()
      {
        if (!hasNext()) {
          throw new NoSuchElementException();
        }
        i += 1;
        return (V)this$0.map.get(val$key);
      }
      
      public void remove()
      {
        boolean bool = true;
        if (i == 1) {}
        for (;;)
        {
          CollectPreconditions.checkRemove(bool);
          i = -1;
          this$0.map.remove(val$key);
          return;
          bool = false;
        }
      }
    };
  }
  
  public int size()
  {
    if (this$0.map.containsKey(val$key)) {
      return 1;
    }
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multimaps.MapMultimap.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */