package com.google.common.collect;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.AbstractList;
import java.util.RandomAccess;
import javax.annotation.Nullable;

class Lists$TwoPlusArrayList<E>
  extends AbstractList<E>
  implements Serializable, RandomAccess
{
  private static final long serialVersionUID = 0L;
  final E first;
  final E[] rest;
  final E second;
  
  Lists$TwoPlusArrayList(@Nullable E paramE1, @Nullable E paramE2, E[] paramArrayOfE)
  {
    first = paramE1;
    second = paramE2;
    rest = ((Object[])Preconditions.checkNotNull(paramArrayOfE));
  }
  
  public E get(int paramInt)
  {
    switch (paramInt)
    {
    default: 
      Preconditions.checkElementIndex(paramInt, size());
      return (E)rest[(paramInt - 2)];
    case 0: 
      return (E)first;
    }
    return (E)second;
  }
  
  public int size()
  {
    return rest.length + 2;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Lists.TwoPlusArrayList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */