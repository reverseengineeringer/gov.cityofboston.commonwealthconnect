package com.google.common.cache;

import com.google.common.collect.Iterators;
import java.util.AbstractQueue;
import java.util.Iterator;

final class LocalCache$2
  extends AbstractQueue<Object>
{
  public Iterator<Object> iterator()
  {
    return Iterators.emptyIterator();
  }
  
  public boolean offer(Object paramObject)
  {
    return true;
  }
  
  public Object peek()
  {
    return null;
  }
  
  public Object poll()
  {
    return null;
  }
  
  public int size()
  {
    return 0;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */