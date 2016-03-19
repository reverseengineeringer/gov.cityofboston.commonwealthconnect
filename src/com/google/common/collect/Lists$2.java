package com.google.common.collect;

import java.util.List;
import java.util.ListIterator;

final class Lists$2
  extends Lists.AbstractListWrapper<E>
{
  private static final long serialVersionUID = 0L;
  
  Lists$2(List paramList)
  {
    super(paramList);
  }
  
  public ListIterator<E> listIterator(int paramInt)
  {
    return backingList.listIterator(paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */