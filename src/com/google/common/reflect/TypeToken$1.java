package com.google.common.reflect;

import java.lang.reflect.Method;
import java.lang.reflect.Type;

class TypeToken$1
  extends Invokable.MethodInvokable<T>
{
  TypeToken$1(TypeToken paramTypeToken, Method paramMethod)
  {
    super(paramMethod);
  }
  
  Type[] getGenericExceptionTypes()
  {
    return TypeToken.access$000(this$0, super.getGenericExceptionTypes());
  }
  
  Type[] getGenericParameterTypes()
  {
    return TypeToken.access$000(this$0, super.getGenericParameterTypes());
  }
  
  Type getGenericReturnType()
  {
    return this$0.resolveType(super.getGenericReturnType()).getType();
  }
  
  public TypeToken<T> getOwnerType()
  {
    return this$0;
  }
  
  public String toString()
  {
    return getOwnerType() + "." + super.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */