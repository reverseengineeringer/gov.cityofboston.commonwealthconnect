package com.google.common.collect;

import java.util.Set;
import javax.annotation.Nullable;

class Synchronized$SynchronizedMultiset<E>
  extends Synchronized.SynchronizedCollection<E>
  implements Multiset<E>
{
  private static final long serialVersionUID = 0L;
  transient Set<E> elementSet;
  transient Set<Multiset.Entry<E>> entrySet;
  
  Synchronized$SynchronizedMultiset(Multiset<E> paramMultiset, @Nullable Object paramObject)
  {
    super(paramMultiset, paramObject, null);
  }
  
  public int add(E paramE, int paramInt)
  {
    synchronized (mutex)
    {
      paramInt = delegate().add(paramE, paramInt);
      return paramInt;
    }
  }
  
  public int count(Object paramObject)
  {
    synchronized (mutex)
    {
      int i = delegate().count(paramObject);
      return i;
    }
  }
  
  Multiset<E> delegate()
  {
    return (Multiset)super.delegate();
  }
  
  public Set<E> elementSet()
  {
    synchronized (mutex)
    {
      if (elementSet == null) {
        elementSet = Synchronized.access$300(delegate().elementSet(), mutex);
      }
      Set localSet = elementSet;
      return localSet;
    }
  }
  
  public Set<Multiset.Entry<E>> entrySet()
  {
    synchronized (mutex)
    {
      if (entrySet == null) {
        entrySet = Synchronized.access$300(delegate().entrySet(), mutex);
      }
      Set localSet = entrySet;
      return localSet;
    }
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
  
  public int hashCode()
  {
    synchronized (mutex)
    {
      int i = delegate().hashCode();
      return i;
    }
  }
  
  public int remove(Object paramObject, int paramInt)
  {
    synchronized (mutex)
    {
      paramInt = delegate().remove(paramObject, paramInt);
      return paramInt;
    }
  }
  
  public int setCount(E paramE, int paramInt)
  {
    synchronized (mutex)
    {
      paramInt = delegate().setCount(paramE, paramInt);
      return paramInt;
    }
  }
  
  public boolean setCount(E paramE, int paramInt1, int paramInt2)
  {
    synchronized (mutex)
    {
      boolean bool = delegate().setCount(paramE, paramInt1, paramInt2);
      return bool;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Synchronized.SynchronizedMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */