package com.google.common.collect;

import java.util.Queue;
import javax.annotation.Nullable;

class Synchronized$SynchronizedQueue<E>
  extends Synchronized.SynchronizedCollection<E>
  implements Queue<E>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedQueue(Queue<E> paramQueue, @Nullable Object paramObject)
  {
    super(paramQueue, paramObject, null);
  }
  
  Queue<E> delegate()
  {
    return (Queue)super.delegate();
  }
  
  public E element()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().element();
      return (E)localObject2;
    }
  }
  
  public boolean offer(E paramE)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().offer(paramE);
      return bool;
    }
  }
  
  public E peek()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().peek();
      return (E)localObject2;
    }
  }
  
  public E poll()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().poll();
      return (E)localObject2;
    }
  }
  
  public E remove()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().remove();
      return (E)localObject2;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedQueue
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */