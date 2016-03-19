package com.google.common.reflect;

import com.google.common.base.Preconditions;
import java.lang.reflect.Type;

 enum Types$JavaVersion$3
{
  Types$JavaVersion$3()
  {
    super(paramString, paramInt, null);
  }
  
  Type newArrayType(Type paramType)
  {
    if ((paramType instanceof Class)) {
      return Types.getArrayClass((Class)paramType);
    }
    return new Types.GenericArrayTypeImpl(paramType);
  }
  
  Type usedInGenericType(Type paramType)
  {
    return (Type)Preconditions.checkNotNull(paramType);
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.JavaVersion.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */