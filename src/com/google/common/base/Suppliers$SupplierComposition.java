package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Suppliers$SupplierComposition<F, T>
  implements Supplier<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  final Function<? super F, T> function;
  final Supplier<F> supplier;
  
  Suppliers$SupplierComposition(Function<? super F, T> paramFunction, Supplier<F> paramSupplier)
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

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers.SupplierComposition
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */