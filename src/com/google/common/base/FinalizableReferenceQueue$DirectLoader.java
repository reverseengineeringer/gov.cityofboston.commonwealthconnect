package com.google.common.base;

class FinalizableReferenceQueue$DirectLoader
  implements FinalizableReferenceQueue.FinalizerLoader
{
  public Class<?> loadFinalizer()
  {
    try
    {
      Class localClass = Class.forName("com.google.common.base.internal.Finalizer");
      return localClass;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new AssertionError(localClassNotFoundException);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.FinalizableReferenceQueue.DirectLoader
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */