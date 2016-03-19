package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

class AbstractMapBasedMultimap$KeySet
  extends Maps.KeySet<K, Collection<V>>
{
  AbstractMapBasedMultimap$KeySet(Map<K, Collection<V>> paramMap)
  {
    super(localMap);
  }
  
  public void clear()
  {
    Iterators.clear(iterator());
  }
  
  public boolean containsAll(Collection<?> paramCollection)
  {
    return map().keySet().containsAll(paramCollection);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return (this == paramObject) || (map().keySet().equals(paramObject));
  }
  
  public int hashCode()
  {
    return map().keySet().hashCode();
  }
  
  public Iterator<K> iterator()
  {
    new Iterator()
    {
      Map.Entry<K, Collection<V>> entry;
      
      public boolean hasNext()
      {
        return val$entryIterator.hasNext();
      }
      
      public K next()
      {
        entry = ((Map.Entry)val$entryIterator.next());
        return (K)entry.getKey();
      }
      
      public void remove()
      {
        if (entry != null) {}
        for (boolean bool = true;; bool = false)
        {
          CollectPreconditions.checkRemove(bool);
          Collection localCollection = (Collection)entry.getValue();
          val$entryIterator.remove();
          AbstractMapBasedMultimap.access$220(this$0, localCollection.size());
          localCollection.clear();
          return;
        }
      }
    };
  }
  
  public boolean remove(Object paramObject)
  {
    int i = 0;
    paramObject = (Collection)map().remove(paramObject);
    if (paramObject != null)
    {
      i = ((Collection)paramObject).size();
      ((Collection)paramObject).clear();
      AbstractMapBasedMultimap.access$220(this$0, i);
    }
    return i > 0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.AbstractMapBasedMultimap.KeySet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */