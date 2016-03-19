package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import com.google.common.collect.MapMaker;
import java.util.concurrent.ConcurrentMap;

@VisibleForTesting
class Striped$LargeLazyStriped<L>
  extends Striped.PowerOfTwoStriped<L>
{
  final ConcurrentMap<Integer, L> locks;
  final int size;
  final Supplier<L> supplier;
  
  Striped$LargeLazyStriped(int paramInt, Supplier<L> paramSupplier)
  {
    super(paramInt);
    if (mask == -1) {}
    for (paramInt = Integer.MAX_VALUE;; paramInt = mask + 1)
    {
      size = paramInt;
      supplier = paramSupplier;
      locks = new MapMaker().weakValues().makeMap();
      return;
    }
  }
  
  public L getAt(int paramInt)
  {
    if (size != Integer.MAX_VALUE) {
      Preconditions.checkElementIndex(paramInt, size());
    }
    Object localObject = locks.get(Integer.valueOf(paramInt));
    if (localObject != null) {
      return (L)localObject;
    }
    localObject = supplier.get();
    return (L)Objects.firstNonNull(locks.putIfAbsent(Integer.valueOf(paramInt), localObject), localObject);
  }
  
  public int size()
  {
    return size;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Striped.LargeLazyStriped
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */