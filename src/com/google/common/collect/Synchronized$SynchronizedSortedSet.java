package com.google.common.collect;

import java.util.Comparator;
import java.util.SortedSet;
import javax.annotation.Nullable;

class Synchronized$SynchronizedSortedSet<E>
  extends Synchronized.SynchronizedSet<E>
  implements SortedSet<E>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedSortedSet(SortedSet<E> paramSortedSet, @Nullable Object paramObject)
  {
    super(paramSortedSet, paramObject);
  }
  
  public Comparator<? super E> comparator()
  {
    synchronized (mutex)
    {
      Comparator localComparator = delegate().comparator();
      return localComparator;
    }
  }
  
  SortedSet<E> delegate()
  {
    return (SortedSet)super.delegate();
  }
  
  public E first()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().first();
      return (E)localObject2;
    }
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    synchronized (mutex)
    {
      paramE = Synchronized.access$100(delegate().headSet(paramE), mutex);
      return paramE;
    }
  }
  
  public E last()
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().last();
      return (E)localObject2;
    }
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    synchronized (mutex)
    {
      paramE1 = Synchronized.access$100(delegate().subSet(paramE1, paramE2), mutex);
      return paramE1;
    }
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    synchronized (mutex)
    {
      paramE = Synchronized.access$100(delegate().tailSet(paramE), mutex);
      return paramE;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedSortedSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */