package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Functions$SupplierFunction<T>
  implements Function<Object, T>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Supplier<T> supplier;
  
  private Functions$SupplierFunction(Supplier<T> paramSupplier)
  {
    supplier = ((Supplier)Preconditions.checkNotNull(paramSupplier));
  }
  
  public T apply(@Nullable Object paramObject)
  {
    return (T)supplier.get();
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof SupplierFunction))
    {
      paramObject = (SupplierFunction)paramObject;
      return supplier.equals(supplier);
    }
    return false;
  }
  
  public int hashCode()
  {
    return supplier.hashCode();
  }
  
  public String toString()
  {
    return "forSupplier(" + supplier + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions.SupplierFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */