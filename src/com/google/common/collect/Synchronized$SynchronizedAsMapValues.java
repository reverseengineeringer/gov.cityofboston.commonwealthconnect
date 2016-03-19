package com.google.common.collect;

import java.util.Collection;
import java.util.Iterator;
import javax.annotation.Nullable;

class Synchronized$SynchronizedAsMapValues<V>
  extends Synchronized.SynchronizedCollection<Collection<V>>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedAsMapValues(Collection<Collection<V>> paramCollection, @Nullable Object paramObject)
  {
    super(paramCollection, paramObject, null);
  }
  
  public Iterator<Collection<V>> iterator()
  {
    new ForwardingIterator()
    {
      protected Iterator<Collection<V>> delegate()
      {
        return val$iterator;
      }
      
      public Collection<V> next()
      {
        return Synchronized.access$400((Collection)super.next(), mutex);
      }
    };
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedAsMapValues
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */