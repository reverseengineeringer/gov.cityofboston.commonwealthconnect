package com.google.common.base;

import java.io.Serializable;
import javax.annotation.Nullable;

final class Enums$StringConverter<T extends Enum<T>>
  extends Converter<String, T>
  implements Serializable
{
  private static final long serialVersionUID = 0L;
  private final Class<T> enumClass;
  
  Enums$StringConverter(Class<T> paramClass)
  {
    enumClass = ((Class)Preconditions.checkNotNull(paramClass));
  }
  
  protected String doBackward(T paramT)
  {
    return paramT.name();
  }
  
  protected T doForward(String paramString)
  {
    return Enum.valueOf(enumClass, paramString);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    if ((paramObject instanceof StringConverter))
    {
      paramObject = (StringConverter)paramObject;
      return enumClass.equals(enumClass);
    }
    return false;
  }
  
  public int hashCode()
  {
    return enumClass.hashCode();
  }
  
  public String toString()
  {
    return "Enums.stringConverter(" + enumClass.getName() + ".class)";
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Enums.StringConverter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */