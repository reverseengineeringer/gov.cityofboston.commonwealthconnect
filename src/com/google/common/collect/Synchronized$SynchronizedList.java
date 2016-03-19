package com.google.common.collect;

import java.util.Collection;
import java.util.List;
import java.util.ListIterator;
import javax.annotation.Nullable;

class Synchronized$SynchronizedList<E>
  extends Synchronized.SynchronizedCollection<E>
  implements List<E>
{
  private static final long serialVersionUID = 0L;
  
  Synchronized$SynchronizedList(List<E> paramList, @Nullable Object paramObject)
  {
    super(paramList, paramObject, null);
  }
  
  public void add(int paramInt, E paramE)
  {
    synchronized (mutex)
    {
      delegate().add(paramInt, paramE);
      return;
    }
  }
  
  public boolean addAll(int paramInt, Collection<? extends E> paramCollection)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().addAll(paramInt, paramCollection);
      return bool;
    }
  }
  
  List<E> delegate()
  {
    return (List)super.delegate();
  }
  
  public boolean equals(Object paramObject)
  {
    if (paramObject == this) {
      return true;
    }
    synchronized (mutex)
    {
      boolean bool = delegate().equals(paramObject);
      return bool;
    }
  }
  
  public E get(int paramInt)
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().get(paramInt);
      return (E)localObject2;
    }
  }
  
  public int hashCode()
  {
    synchronized (mutex)
    {
      int i = delegate().hashCode();
      return i;
    }
  }
  
  public int indexOf(Object paramObject)
  {
    synchronized (mutex)
    {
      int i = delegate().indexOf(paramObject);
      return i;
    }
  }
  
  public int lastIndexOf(Object paramObject)
  {
    synchronized (mutex)
    {
      int i = delegate().lastIndexOf(paramObject);
      return i;
    }
  }
  
  public ListIterator<E> listIterator()
  {
    return delegate().listIterator();
  }
  
  public ListIterator<E> listIterator(int paramInt)
  {
    return delegate().listIterator(paramInt);
  }
  
  public E remove(int paramInt)
  {
    synchronized (mutex)
    {
      Object localObject2 = delegate().remove(paramInt);
      return (E)localObject2;
    }
  }
  
  public E set(int paramInt, E paramE)
  {
    synchronized (mutex)
    {
      paramE = delegate().set(paramInt, paramE);
      return paramE;
    }
  }
  
  public List<E> subList(int paramInt1, int paramInt2)
  {
    synchronized (mutex)
    {
      List localList = Synchronized.access$200(delegate().subList(paramInt1, paramInt2), mutex);
      return localList;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */