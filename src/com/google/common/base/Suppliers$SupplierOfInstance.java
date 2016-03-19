package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Suppliers$SupplierOfInstance<T>
  implements Supplier<T>, Serializable
{
  private static final long serialVersionUID = 0L;
  final T instance;
  
  Suppliers$SupplierOfInstance(@Nullable T paramT)
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

/* Location:
 * Qualified Name:     com.google.common.base.Suppliers.SupplierOfInstance
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */