package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.util.AbstractList;
import java.util.Collection;
import java.util.List;

class Lists$AbstractListWrapper<E>
  extends AbstractList<E>
{
  final List<E> backingList;
  
  Lists$AbstractListWrapper(List<E> paramList)
  {
    backingList = ((List)Preconditions.checkNotNull(paramList));
  }
  
  public void add(int paramInt, E paramE)
  {
    backingList.add(paramInt, paramE);
  }
  
  public boolean addAll(int paramInt, Collection<? extends E> paramCollection)
  {
    return backingList.addAll(paramInt, paramCollection);
  }
  
  public boolean contains(Object paramObject)
  {
    return backingList.contains(paramObject);
  }
  
  public E get(int paramInt)
  {
    return (E)backingList.get(paramInt);
  }
  
  public E remove(int paramInt)
  {
    return (E)backingList.remove(paramInt);
  }
  
  public E set(int paramInt, E paramE)
  {
    return (E)backingList.set(paramInt, paramE);
  }
  
  public int size()
  {
    return backingList.size();
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.AbstractListWrapper
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */