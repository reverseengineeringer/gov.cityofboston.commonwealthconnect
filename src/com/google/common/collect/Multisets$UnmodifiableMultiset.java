package com.google.common.collect;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Set;

class Multisets$UnmodifiableMultiset<E>
  extends ForwardingMultiset<E>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final Multiset<? extends E> delegate;
  transient Set<E> elementSet;
  transient Set<Multiset.Entry<E>> entrySet;
  
  Multisets$UnmodifiableMultiset(Multiset<? extends E> paramMultiset)
  {
    delegate = paramMultiset;
  }
  
  public int add(E paramE, int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean add(E paramE)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean addAll(Collection<? extends E> paramCollection)
  {
    throw new UnsupportedOperationException();
  }
  
  public void clear()
  {
    throw new UnsupportedOperationException();
  }
  
  Set<E> createElementSet()
  {
    return Collections.unmodifiableSet(delegate.elementSet());
  }
  
  protected Multiset<E> delegate()
  {
    return delegate;
  }
  
  public Set<E> elementSet()
  {
    Set localSet2 = elementSet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = createElementSet();
      elementSet = localSet1;
    }
    return localSet1;
  }
  
  public Set<Multiset.Entry<E>> entrySet()
  {
    Set localSet2 = entrySet;
    Set localSet1 = localSet2;
    if (localSet2 == null)
    {
      localSet1 = Collections.unmodifiableSet(delegate.entrySet());
      entrySet = localSet1;
    }
    return localSet1;
  }
  
  public Iterator<E> iterator()
  {
    return Iterators.unmodifiableIterator(delegate.iterator());
  }
  
  public int remove(Object paramObject, int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean remove(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean removeAll(Collection<?> paramCollection)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean retainAll(Collection<?> paramCollection)
  {
    throw new UnsupportedOperationException();
  }
  
  public int setCount(E paramE, int paramInt)
  {
    throw new UnsupportedOperationException();
  }
  
  public boolean setCount(E paramE, int paramInt1, int paramInt2)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.UnmodifiableMultiset
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */