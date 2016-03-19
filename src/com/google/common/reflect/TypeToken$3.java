package com.google.common.reflect;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;

class TypeToken$3
  extends TypeVisitor
{
  TypeToken$3(TypeToken paramTypeToken) {}
  
  void visitGenericArrayType(GenericArrayType paramGenericArrayType)
  {
    visit(new Type[] { paramGenericArrayType.getGenericComponentType() });
  }
  
  void visitParameterizedType(ParameterizedType paramParameterizedType)
  {
    visit(paramParameterizedType.getActualTypeArguments());
    visit(new Type[] { paramParameterizedType.getOwnerType() });
  }
  
  void visitTypeVariable(TypeVariable<?> paramTypeVariable)
  {
    throw new IllegalArgumentException(TypeToken.access$400(this$0) + "contains a type variable and is not safe for the operation");
  }
  
  void visitWildcardType(WildcardType paramWildcardType)
  {
    visit(paramWildcardType.getLowerBounds());
    visit(paramWildcardType.getUpperBounds());
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */