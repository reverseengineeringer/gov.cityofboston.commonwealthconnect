package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import java.util.Deque;
import java.util.Iterator;
import javax.annotation.Nullable;

@GwtIncompatible("Deque")
final class Synchronized$SynchronizedDeque<E>
  extends Synchronized.SynchronizedQueue<E>
  implements Deque<E>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedDeque(Deque<E> paramDeque, @Nullable Object paramObject)
  {
    super(paramDeque, paramObject);
  }
  
  public void addFirst(E paramE)
  {
    synchronized (mutex)
    {
      delegate().addFirst(paramE);
      return;
    }
  }
  
  public void addLast(E paramE)
  {
    synchronized (mutex)
    {
      delegate().addLast(paramE);
      return;
    }
  }
  
  Deque<E> delegate()
  {
    return (Deque)super.delegate();
  }
  
  public Iterator<E> descendingIterator()
  {
    synchronized (mutex)
    {
      Iterator localIterator = delegate().descendingIterator();
      return localIterator;
    }
  }
  
  public E getFirst()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().getFirst();
      return (E)localObject2;
    }
  }
  
  public E getLast()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().getLast();
      return (E)localObject2;
    }
  }
  
  public boolean offerFirst(E paramE)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().offerFirst(paramE);
      return bool;
    }
  }
  
  public boolean offerLast(E paramE)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().offerLast(paramE);
      return bool;
    }
  }
  
  public E peekFirst()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().peekFirst();
      return (E)localObject2;
    }
  }
  
  public E peekLast()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().peekLast();
      return (E)localObject2;
    }
  }
  
  public E pollFirst()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().pollFirst();
      return (E)localObject2;
    }
  }
  
  public E pollLast()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().pollLast();
      return (E)localObject2;
    }
  }
  
  public E pop()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().pop();
      return (E)localObject2;
    }
  }
  
  public void push(E paramE)
  {
    synchronized (mutex)
    {
      delegate().push(paramE);
      return;
    }
  }
  
  public E removeFirst()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().removeFirst();
      return (E)localObject2;
    }
  }
  
  public boolean removeFirstOccurrence(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().removeFirstOccurrence(paramObject);
      return bool;
    }
  }
  
  public E removeLast()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().removeLast();
      return (E)localObject2;
    }
  }
  
  public boolean removeLastOccurrence(Object paramObject)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().removeLastOccurrence(paramObject);
      return bool;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedDeque
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */