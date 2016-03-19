package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;

abstract class Striped$PowerOfTwoStriped<L>
  extends Striped<L>
{
  final int mask;
  
  Striped$PowerOfTwoStriped(int paramInt)
  {
    super(null);
    boolean bool;
    if (paramInt > 0)
    {
      bool = true;
      Preconditions.checkArgument(bool, "Stripes must be positive");
      if (paramInt <= 1073741824) {
        break label36;
      }
    }
    label36:
    for (paramInt = -1;; paramInt = Striped.access$200(paramInt) - 1)
    {
      mask = paramInt;
      return;
      bool = false;
      break;
    }
  }
  
  public final L get(Object paramObject)
  {
    return (L)getAt(indexFor(paramObject));
  }
  
  final int indexFor(Object paramObject)
  {
    int i = Striped.access$300(paramObject.hashCode());
    return mask & i;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Striped.PowerOfTwoStriped
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */