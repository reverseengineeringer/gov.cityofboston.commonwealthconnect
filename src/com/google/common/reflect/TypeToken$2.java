package com.google.common.reflect;

import com.google.common.base.Joiner;
import java.lang.reflect.Constructor;
import java.lang.reflect.Type;

class TypeToken$2
  extends Invokable.ConstructorInvokable<T>
{
  TypeToken$2(TypeToken paramTypeToken, Constructor paramConstructor)
  {
    super(paramConstructor);
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
    return getOwnerType() + "(" + Joiner.on(", ").join(getGenericParameterTypes()) + ")";
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */