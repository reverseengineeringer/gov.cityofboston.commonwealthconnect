package com.google.common.base;

import java.io.Serializable;

class Suppliers$ThreadSafeSupplier<T>
  implements Supplier<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Supplier<T> delegate;
  
  Suppliers$ThreadSafeSupplier(Supplier<T> paramSupplier)
  {
    delegate = paramSupplier;
  }
  
  public T get()
  {
    synchronized (delegate)
    {
      Object localObject1 = delegate.get();
      return (T)localObject1;
    }
  }
  
  public String toString()
  {
    return "Suppliers.synchronizedSupplier(" + delegate + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers.ThreadSafeSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */