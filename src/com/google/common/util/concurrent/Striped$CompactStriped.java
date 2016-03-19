package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;

class Striped$CompactStriped<L>
  extends Striped.PowerOfTwoStriped<L>
{
  private final Object[] array;
  
  private Striped$CompactStriped(int paramInt, Supplier<L> paramSupplier)
  {
    super(paramInt);
    if (paramInt <= 1073741824) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Stripes must be <= 2^30)");
      array = new Object[mask + 1];
      paramInt = 0;
      while (paramInt < array.length)
      {
        array[paramInt] = paramSupplier.get();
        paramInt += 1;
      }
    }
  }
  
  public L getAt(int paramInt)
  {
    return (L)array[paramInt];
  }
  
  public int size()
  {
    return array.length;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Striped.CompactStriped
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */