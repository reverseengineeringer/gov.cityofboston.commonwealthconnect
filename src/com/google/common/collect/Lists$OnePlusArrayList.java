package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.RandomAccess;
import javax.annotation.Nullable;

class Lists$OnePlusArrayList<E>
  extends AbstractList<E>
  implements Serializable, RandomAccess
{
  private static final long serialVersionUID = 0L;
  final E first;
  final E[] rest;
  
  Lists$OnePlusArrayList(@Nullable E paramE, E[] paramArrayOfE)
  {
    first = paramE;
    rest = ((Object[])Preconditions.checkNotNull(paramArrayOfE));
  }
  
  public E get(int paramInt)
  {
    Preconditions.checkElementIndex(paramInt, size());
    if (paramInt == 0) {
      return (E)first;
    }
    return (E)rest[(paramInt - 1)];
  }
  
  public int size()
  {
    return rest.length + 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.OnePlusArrayList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */