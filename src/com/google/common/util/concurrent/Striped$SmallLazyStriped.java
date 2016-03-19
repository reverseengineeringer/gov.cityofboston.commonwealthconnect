package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicReferenceArray;

@VisibleForTesting
class Striped$SmallLazyStriped<L>
  extends Striped.PowerOfTwoStriped<L>
{
  final AtomicReferenceArray<ArrayReference<? extends L>> locks;
  final ReferenceQueue<L> queue = new ReferenceQueue();
  final int size;
  final Supplier<L> supplier;
  
  Striped$SmallLazyStriped(int paramInt, Supplier<L> paramSupplier)
  {
    super(paramInt);
    if (mask == -1) {}
    for (paramInt = Integer.MAX_VALUE;; paramInt = mask + 1)
    {
      size = paramInt;
      locks = new AtomicReferenceArray(size);
      supplier = paramSupplier;
      return;
    }
  }
  
  private void drainQueue()
  {
    for (;;)
    {
      Object localObject = queue.poll();
      if (localObject == null) {
        break;
      }
      localObject = (ArrayReference)localObject;
      locks.compareAndSet(index, localObject, null);
    }
  }
  
  public L getAt(int paramInt)
  {
    if (size != Integer.MAX_VALUE) {
      Preconditions.checkElementIndex(paramInt, size());
    }
    ArrayReference localArrayReference1 = (ArrayReference)locks.get(paramInt);
    if (localArrayReference1 == null) {}
    for (Object localObject1 = null; localObject1 != null; localObject1 = localArrayReference1.get()) {
      return (L)localObject1;
    }
    Object localObject2 = supplier.get();
    ArrayReference localArrayReference2 = new ArrayReference(localObject2, paramInt, queue);
    while (!locks.compareAndSet(paramInt, localArrayReference1, localArrayReference2))
    {
      localArrayReference1 = (ArrayReference)locks.get(paramInt);
      if (localArrayReference1 == null) {}
      for (localObject1 = null; localObject1 != null; localObject1 = localArrayReference1.get()) {
        return (L)localObject1;
      }
    }
    drainQueue();
    return (L)localObject2;
  }
  
  public int size()
  {
    return size;
  }
  
  private static final class ArrayReference<L>
    extends WeakReference<L>
  {
    final int index;
    
    ArrayReference(L paramL, int paramInt, ReferenceQueue<L> paramReferenceQueue)
    {
      super(paramReferenceQueue);
      index = paramInt;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Striped.SmallLazyStriped
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */