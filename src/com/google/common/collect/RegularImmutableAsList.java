package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;

@GwtCompatible(emulated=true)
class RegularImmutableAsList<E>
  extends ImmutableAsList<E>
{
  private final ImmutableCollection<E> delegate;
  private final ImmutableList<? extends E> delegateList;
  
  RegularImmutableAsList(ImmutableCollection<E> paramImmutableCollection, ImmutableList<? extends E> paramImmutableList)
  {
    delegate = paramImmutableCollection;
    delegateList = paramImmutableList;
  }
  
  RegularImmutableAsList(ImmutableCollection<E> paramImmutableCollection, Object[] paramArrayOfObject)
  {
    this(paramImmutableCollection, ImmutableList.asImmutableList(paramArrayOfObject));
  }
  
  @GwtIncompatible("not present in emulated superclass")
  int copyIntoArray(Object[] paramArrayOfObject, int paramInt)
  {
    return delegateList.copyIntoArray(paramArrayOfObject, paramInt);
  }
  
  ImmutableCollection<E> delegateCollection()
  {
    return delegate;
  }
  
  ImmutableList<? extends E> delegateList()
  {
    return delegateList;
  }
  
  public E get(int paramInt)
  {
    return (E)delegateList.get(paramInt);
  }
  
  public UnmodifiableListIterator<E> listIterator(int paramInt)
  {
    return delegateList.listIterator(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.RegularImmutableAsList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */