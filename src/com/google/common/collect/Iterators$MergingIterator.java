package com.google.common.collect;

import java.util.Comparator;
import java.util.Iterator;
import java.util.PriorityQueue;
import java.util.Queue;

class Iterators$MergingIterator<T>
  extends UnmodifiableIterator<T>
{
  final Queue<PeekingIterator<T>> queue;
  
  public Iterators$MergingIterator(Iterable<? extends Iterator<? extends T>> paramIterable, final Comparator<? super T> paramComparator)
  {
    queue = new PriorityQueue(2, new Comparator()
    {
      public int compare(PeekingIterator<T> paramAnonymousPeekingIterator1, PeekingIterator<T> paramAnonymousPeekingIterator2)
      {
        return paramComparator.compare(paramAnonymousPeekingIterator1.peek(), paramAnonymousPeekingIterator2.peek());
      }
    });
    paramIterable = paramIterable.iterator();
    while (paramIterable.hasNext())
    {
      paramComparator = (Iterator)paramIterable.next();
      if (paramComparator.hasNext()) {
        queue.add(Iterators.peekingIterator(paramComparator));
      }
    }
  }
  
  public boolean hasNext()
  {
    return !queue.isEmpty();
  }
  
  public T next()
  {
    PeekingIterator localPeekingIterator = (PeekingIterator)queue.remove();
    Object localObject = localPeekingIterator.next();
    if (localPeekingIterator.hasNext()) {
      queue.add(localPeekingIterator);
    }
    return (T)localObject;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Iterators.MergingIterator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */