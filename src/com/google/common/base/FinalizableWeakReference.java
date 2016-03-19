package com.google.common.base;

import java.lang.ref.WeakReference;

public abstract class FinalizableWeakReference<T>
  extends WeakReference<T>
  implements FinalizableReference
{
  protected FinalizableWeakReference(T paramT, FinalizableReferenceQueue paramFinalizableReferenceQueue)
  {
    super(paramT, queue);
    paramFinalizableReferenceQueue.cleanUp();
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.FinalizableWeakReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */