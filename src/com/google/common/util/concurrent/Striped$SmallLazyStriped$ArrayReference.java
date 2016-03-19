package com.google.common.util.concurrent;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;

final class Striped$SmallLazyStriped$ArrayReference<L>
  extends WeakReference<L>
{
  final int index;
  
  Striped$SmallLazyStriped$ArrayReference(L paramL, int paramInt, ReferenceQueue<L> paramReferenceQueue)
  {
    super(paramL, paramReferenceQueue);
    index = paramInt;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Striped.SmallLazyStriped.ArrayReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */