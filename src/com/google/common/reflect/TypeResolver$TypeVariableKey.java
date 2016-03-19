package com.google.common.reflect;

import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

final class TypeResolver$TypeVariableKey
{
  private final TypeVariable<?> var;
  
  TypeResolver$TypeVariableKey(TypeVariable<?> paramTypeVariable)
  {
    var = ((TypeVariable)Preconditions.checkNotNull(paramTypeVariable));
  }
  
  private boolean equalsTypeVariable(TypeVariable<?> paramTypeVariable)
  {
    return (var.getGenericDeclaration().equals(paramTypeVariable.getGenericDeclaration())) && (var.getName().equals(paramTypeVariable.getName()));
  }
  
  static Object forLookup(Type paramType)
  {
    if ((paramType instanceof TypeVariable)) {
      return new TypeVariableKey((TypeVariable)paramType);
    }
    return null;
  }
  
  public boolean equals(Object paramObject)
  {
    if ((paramObject instanceof TypeVariableKey)) {
      return equalsTypeVariable(var);
    }
    return false;
  }
  
  boolean equalsType(Type paramType)
  {
    if ((paramType instanceof TypeVariable)) {
      return equalsTypeVariable((TypeVariable)paramType);
    }
    return false;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { var.getGenericDeclaration(), var.getName() });
  }
  
  public String toString()
  {
    return var.toString();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeResolver.TypeVariableKey
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */