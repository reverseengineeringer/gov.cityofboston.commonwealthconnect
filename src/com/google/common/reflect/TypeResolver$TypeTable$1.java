package com.google.common.reflect;

import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

class TypeResolver$TypeTable$1
  extends TypeResolver.TypeTable
{
  TypeResolver$TypeTable$1(TypeResolver.TypeTable paramTypeTable1, TypeVariable paramTypeVariable, TypeResolver.TypeTable paramTypeTable2) {}
  
  public Type resolveInternal(TypeVariable<?> paramTypeVariable, TypeResolver.TypeTable paramTypeTable)
  {
    if (paramTypeVariable.getGenericDeclaration().equals(val$var.getGenericDeclaration())) {
      return paramTypeVariable;
    }
    return val$unguarded.resolveInternal(paramTypeVariable, paramTypeTable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeResolver.TypeTable.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */