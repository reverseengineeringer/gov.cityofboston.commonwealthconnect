package com.google.common.base;

import com.google.common.annotations.VisibleForTesting;
import java.io.Serializable;

@VisibleForTesting
class Suppliers$MemoizingSupplier<T>
  implements Supplier<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Supplier<T> delegate;
  volatile transient boolean initialized;
  transient T value;
  
  Suppliers$MemoizingSupplier(Supplier<T> paramSupplier)
  {
    delegate = paramSupplier;
  }
  
  public T get()
  {
    if (!initialized) {}
    try
    {
      if (!initialized)
      {
        Object localObject1 = delegate.get();
        value = localObject1;
        initialized = true;
        return (T)localObject1;
      }
      return (T)value;
    }
    finally {}
  }
  
  public String toString()
  {
    return "Suppliers.memoize(" + delegate + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers.MemoizingSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */