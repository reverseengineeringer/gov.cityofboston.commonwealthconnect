package com.google.common.collect;

import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import java.util.Iterator;
import java.util.NavigableSet;
import java.util.SortedSet;
import javax.annotation.Nullable;

@GwtIncompatible("NavigableSet")
@VisibleForTesting
class Synchronized$SynchronizedNavigableSet<E>
  extends Synchronized.SynchronizedSortedSet<E>
  implements NavigableSet<E>
{
  private static final long serialVersionUID = 0L;
  transient NavigableSet<E> descendingSet;
  
  Synchronized$SynchronizedNavigableSet(NavigableSet<E> paramNavigableSet, @Nullable Object paramObject)
  {
    super(paramNavigableSet, paramObject);
  }
  
  public E ceiling(E paramE)
  {
    synchronized (mutex)
    {
      paramE = delegate().ceiling(paramE);
      return paramE;
    }
  }
  
  NavigableSet<E> delegate()
  {
    return (NavigableSet)super.delegate();
  }
  
  public Iterator<E> descendingIterator()
  {
    return delegate().descendingIterator();
  }
  
  public NavigableSet<E> descendingSet()
  {
    synchronized (mutex)
    {
      if (descendingSet == null)
      {
        localNavigableSet = Synchronized.navigableSet(delegate().descendingSet(), mutex);
        descendingSet = localNavigableSet;
        return localNavigableSet;
      }
      NavigableSet localNavigableSet = descendingSet;
      return localNavigableSet;
    }
  }
  
  public E floor(E paramE)
  {
    synchronized (mutex)
    {
      paramE = delegate().floor(paramE);
      return paramE;
    }
  }
  
  public NavigableSet<E> headSet(E paramE, boolean paramBoolean)
  {
    synchronized (mutex)
    {
      paramE = Synchronized.navigableSet(delegate().headSet(paramE, paramBoolean), mutex);
      return paramE;
    }
  }
  
  public SortedSet<E> headSet(E paramE)
  {
    return headSet(paramE, false);
  }
  
  public E higher(E paramE)
  {
    synchronized (mutex)
    {
      paramE = delegate().higher(paramE);
      return paramE;
    }
  }
  
  public E lower(E paramE)
  {
    synchronized (mutex)
    {
      paramE = delegate().lower(paramE);
      return paramE;
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
  
  public NavigableSet<E> subSet(E paramE1, boolean paramBoolean1, E paramE2, boolean paramBoolean2)
  {
    synchronized (mutex)
    {
      paramE1 = Synchronized.navigableSet(delegate().subSet(paramE1, paramBoolean1, paramE2, paramBoolean2), mutex);
      return paramE1;
    }
  }
  
  public SortedSet<E> subSet(E paramE1, E paramE2)
  {
    return subSet(paramE1, true, paramE2, false);
  }
  
  public NavigableSet<E> tailSet(E paramE, boolean paramBoolean)
  {
    synchronized (mutex)
    {
      paramE = Synchronized.navigableSet(delegate().tailSet(paramE, paramBoolean), mutex);
      return paramE;
    }
  }
  
  public SortedSet<E> tailSet(E paramE)
  {
    return tailSet(paramE, true);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedNavigableSet
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */