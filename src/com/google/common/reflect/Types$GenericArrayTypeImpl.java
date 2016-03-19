package com.google.common.reflect;

import com.google.common.base.Objects;
import java.io.Serializable;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

final class Types$GenericArrayTypeImpl
  implements GenericArrayType, Serializable
{
  private static final long serialVersionUID = 0L;
  private final Type componentType;
  
  Types$GenericArrayTypeImpl(Type paramType)
  {
    componentType = Types.JavaVersion.CURRENT.usedInGenericType(paramType);
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof GenericArrayType))
    {
      paramObject = (GenericArrayType)paramObject;
      return Objects.equal(getGenericComponentType(), ((GenericArrayType)paramObject).getGenericComponentType());
    }
    return false;
  }
  
  public Type getGenericComponentType()
  {
    return componentType;
  }
  
  public int hashCode()
  {
    return componentType.hashCode();
  }
  
  public String toString()
  {
    return Types.toString(componentType) + "[]";
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.GenericArrayTypeImpl
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */