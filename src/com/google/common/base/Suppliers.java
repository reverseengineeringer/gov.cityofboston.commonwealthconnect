package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.VisibleForTesting;
import java.io.Serializable;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;

@GwtCompatible
public final class Suppliers
{
  public static <F, T> Supplier<T> compose(Function<? super F, T> paramFunction, Supplier<F> paramSupplier)
  {
    Preconditions.checkNotNull(paramFunction);
    Preconditions.checkNotNull(paramSupplier);
    return new SupplierComposition(paramFunction, paramSupplier);
  }
  
  public static <T> Supplier<T> memoize(Supplier<T> paramSupplier)
  {
    if ((paramSupplier instanceof MemoizingSupplier)) {
      return paramSupplier;
    }
    return new MemoizingSupplier((Supplier)Preconditions.checkNotNull(paramSupplier));
  }
  
  public static <T> Supplier<T> memoizeWithExpiration(Supplier<T> paramSupplier, long paramLong, TimeUnit paramTimeUnit)
  {
    return new ExpiringMemoizingSupplier(paramSupplier, paramLong, paramTimeUnit);
  }
  
  public static <T> Supplier<T> ofInstance(@Nullable T paramT)
  {
    return new SupplierOfInstance(paramT);
  }
  
  @Beta
  public static <T> Function<Supplier<T>, T> supplierFunction()
  {
    return SupplierFunctionImpl.INSTANCE;
  }
  
  public static <T> Supplier<T> synchronizedSupplier(Supplier<T> paramSupplier)
  {
    return new ThreadSafeSupplier((Supplier)Preconditions.checkNotNull(paramSupplier));
  }
  
  @VisibleForTesting
  static class ExpiringMemoizingSupplier<T>
    implements Supplier<T>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Supplier<T> delegate;
    final long durationNanos;
    volatile transient long expirationNanos;
    volatile transient T value;
    
    ExpiringMemoizingSupplier(Supplier<T> paramSupplier, long paramLong, TimeUnit paramTimeUnit)
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
  
  @VisibleForTesting
  static class MemoizingSupplier<T>
    implements Supplier<T>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Supplier<T> delegate;
    volatile transient boolean initialized;
    transient T value;
    
    MemoizingSupplier(Supplier<T> paramSupplier)
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
  
  private static class SupplierComposition<F, T>
    implements Supplier<T>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Function<? super F, T> function;
    final Supplier<F> supplier;
    
    SupplierComposition(Function<? super F, T> paramFunction, Supplier<F> paramSupplier)
    {
      function = paramFunction;
      supplier = paramSupplier;
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof SupplierComposition))
      {
        paramObject = (SupplierComposition)paramObject;
        bool1 = bool2;
        if (function.equals(function))
        {
          bool1 = bool2;
          if (supplier.equals(supplier)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public T get()
    {
      return (T)function.apply(supplier.get());
    }
    
    public int hashCode()
    {
      return Objects.hashCode(new Object[] { function, supplier });
    }
    
    public String toString()
    {
      return "Suppliers.compose(" + function + ", " + supplier + ")";
    }
  }
  
  private static abstract interface SupplierFunction<T>
    extends Function<Supplier<T>, T>
  {}
  
  private static enum SupplierFunctionImpl
    implements Suppliers.SupplierFunction<Object>
  {
    INSTANCE;
    
    private SupplierFunctionImpl() {}
    
    public Object apply(Supplier<Object> paramSupplier)
    {
      return paramSupplier.get();
    }
    
    public String toString()
    {
      return "Suppliers.supplierFunction()";
    }
  }
  
  private static class SupplierOfInstance<T>
    implements Supplier<T>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final T instance;
    
    SupplierOfInstance(@Nullable T paramT)
    {
      instance = paramT;
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      if ((paramObject instanceof SupplierOfInstance))
      {
        paramObject = (SupplierOfInstance)paramObject;
        return Objects.equal(instance, instance);
      }
      return false;
    }
    
    public T get()
    {
      return (T)instance;
    }
    
    public int hashCode()
    {
      return Objects.hashCode(new Object[] { instance });
    }
    
    public String toString()
    {
      return "Suppliers.ofInstance(" + instance + ")";
    }
  }
  
  private static class ThreadSafeSupplier<T>
    implements Supplier<T>, Serializable
  {
    private static final long serialVersionUID = 0L;
    final Supplier<T> delegate;
    
    ThreadSafeSupplier(Supplier<T> paramSupplier)
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
}

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */