package com.google.common.collect;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Multisets$ImmutableEntry<E>
  extends Multisets.AbstractEntry<E>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  final int count;
  @Nullable
  final E element;
  
  Multisets$ImmutableEntry(@Nullable E paramE, int paramInt)
  {
    element = paramE;
    count = paramInt;
    CollectPreconditions.checkNonnegative(paramInt, "count");
  }
  
  public int getCount()
  {
    return count;
  }
  
  @Nullable
  public E getElement()
  {
    return (E)element;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.Multisets.ImmutableEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */