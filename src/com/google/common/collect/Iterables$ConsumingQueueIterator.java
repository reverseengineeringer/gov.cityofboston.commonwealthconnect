package com.google.common.collect;

import java.util.NoSuchElementException;
import java.util.Queue;

class Iterables$ConsumingQueueIterator<T>
  extends AbstractIterator<T>
{
  private final Queue<T> queue;
  
  private Iterables$ConsumingQueueIterator(Queue<T> paramQueue)
  {
    queue = paramQueue;
  }
  
  public T computeNext()
  {
    try
    {
      Object localObject = queue.remove();
      return (T)localObject;
    }
    catch (NoSuchElementException localNoSuchElementException) {}
    return (T)endOfData();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterables.ConsumingQueueIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */