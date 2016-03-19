package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Enums$ValueOfFunction<T extends Enum<T>>
  implements Function<String, T>, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Class<T> enumClass;
  
  private Enums$ValueOfFunction(Class<T> paramClass)
  {
    enumClass = ((Class)Preconditions.checkNotNull(paramClass));
  }
  
  public T apply(String paramString)
  {
    try
    {
      paramString = Enum.valueOf(enumClass, paramString);
      return paramString;
    }
    catch (IllegalArgumentException paramString) {}
    return null;
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    return ((paramObject instanceof ValueOfFunction)) && (enumClass.equals(enumClass));
  }
  
  public int hashCode()
  {
    return enumClass.hashCode();
  }
  
  public String toString()
  {
    return "Enums.valueOf(" + enumClass + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Enums.ValueOfFunction
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */