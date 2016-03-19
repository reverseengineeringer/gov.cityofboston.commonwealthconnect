package com.google.common.reflect;

import com.google.common.collect.ImmutableSet.Builder;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;

final class TypeToken$4
  extends TypeVisitor
{
  TypeToken$4(ImmutableSet.Builder paramBuilder) {}
  
  void visitClass(Class<?> paramClass)
  {
    val$builder.add(paramClass);
  }
  
  void visitGenericArrayType(GenericArrayType paramGenericArrayType)
  {
    val$builder.add(Types.getArrayClass(TypeToken.getRawType(paramGenericArrayType.getGenericComponentType())));
  }
  
  void visitParameterizedType(ParameterizedType paramParameterizedType)
  {
    val$builder.add((Class)paramParameterizedType.getRawType());
  }
  
  void visitTypeVariable(TypeVariable<?> paramTypeVariable)
  {
    visit(paramTypeVariable.getBounds());
  }
  
  void visitWildcardType(WildcardType paramWildcardType)
  {
    visit(paramWildcardType.getUpperBounds());
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeToken.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */