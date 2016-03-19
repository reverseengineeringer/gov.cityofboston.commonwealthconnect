package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

class Functions$ConstantFunction<E>
  implements Function<Object, E>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final E value;
  
  public Functions$ConstantFunction(@Nullable E paramE)
  {
    value = paramE;
  }
  
  public E apply(@Nullable Object paramObject)
  {
    return (E)value;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof ConstantFunction))
    {
      paramObject = (ConstantFunction)paramObject;
      return Objects.equal(value, value);
    }
    return false;
  }
  
  public int hashCode()
  {
    if (value == null) {
      return 0;
    }
    return value.hashCode();
  }
  
  public String toString()
  {
    return "constant(" + value + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Functions.ConstantFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */