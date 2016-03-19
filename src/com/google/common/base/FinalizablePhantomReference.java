package com.google.common.base;

import java.lang.ref.PhantomReference;

public abstract class FinalizablePhantomReference<T>
  extends PhantomReference<T>
  implements FinalizableReference
{
  protected FinalizablePhantomReference(T paramT, FinalizableReferenceQueue paramFinalizableReferenceQueue)
  {
    super(paramT, queue);
    paramFinalizableReferenceQueue.cleanUp();
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.FinalizablePhantomReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */