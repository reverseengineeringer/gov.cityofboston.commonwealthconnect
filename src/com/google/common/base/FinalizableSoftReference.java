package com.google.common.base;

import java.lang.ref.SoftReference;

public abstract class FinalizableSoftReference<T>
  extends SoftReference<T>
  implements FinalizableReference
{
  protected FinalizableSoftReference(T paramT, FinalizableReferenceQueue paramFinalizableReferenceQueue)
  {
    super(paramT, queue);
    paramFinalizableReferenceQueue.cleanUp();
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.FinalizableSoftReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */