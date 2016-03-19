package com.google.common.collect;

import java.util.ConcurrentModificationException;
import javax.annotation.Nullable;

final class TreeMultiset$Reference<T>
{
  @Nullable
  private T value;
  
  public void checkAndSet(@Nullable T paramT1, T paramT2)
  {
    if (value != paramT1) {
      throw new ConcurrentModificationException();
    }
    value = paramT2;
  }
  
  @Nullable
  public T get()
  {
    return (T)value;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.TreeMultiset.Reference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */