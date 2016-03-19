package com.google.common.base;

import com.google.common.annotations.VisibleForTesting;
import java.io.Serializable;
import java.util.concurrent.TimeUnit;

@VisibleForTesting
class Suppliers$ExpiringMemoizingSupplier<T>
  implements Supplier<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Supplier<T> delegate;
  final long durationNanos;
  volatile transient long expirationNanos;
  volatile transient T value;
  
  Suppliers$ExpiringMemoizingSupplier(Supplier<T> paramSupplier, long paramLong, TimeUnit paramTimeUnit)
  {
    delegate = ((Supplier)Preconditions.checkNotNull(paramSupplier));
    durationNanos = paramTimeUnit.toNanos(paramLong);
    if (paramLong > 0L) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool);
      return;
    }
  }
  
  public T get()
  {
    long l1 = expirationNanos;
    long l2 = Platform.systemNanoTime();
    if ((l1 == 0L) || (l2 - l1 >= 0L)) {}
    for (;;)
    {
      try
      {
        if (l1 == expirationNanos)
        {
          Object localObject1 = delegate.get();
          value = localObject1;
          l1 = l2 + durationNanos;
          if (l1 == 0L)
          {
            l1 = 1L;
            expirationNanos = l1;
            return (T)localObject1;
          }
        }
        else
        {
          return (T)value;
        }
      }
      finally {}
    }
  }
  
  public String toString()
  {
    return "Suppliers.memoizeWithExpiration(" + delegate + ", " + durationNanos + ", NANOS)";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers.ExpiringMemoizingSupplier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */