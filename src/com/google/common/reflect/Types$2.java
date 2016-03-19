package com.google.common.reflect;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.concurrent.atomic.AtomicReference;

final class Types$2
  extends TypeVisitor
{
  Types$2(AtomicReference paramAtomicReference) {}
  
  void visitClass(Class<?> paramClass)
  {
    val$result.set(paramClass.getComponentType());
  }
  
  void visitGenericArrayType(GenericArrayType paramGenericArrayType)
  {
    val$result.set(paramGenericArrayType.getGenericComponentType());
  }
  
  void visitTypeVariable(TypeVariable<?> paramTypeVariable)
  {
    val$result.set(Types.access$100(paramTypeVariable.getBounds()));
  }
  
  void visitWildcardType(WildcardType paramWildcardType)
  {
    val$result.set(Types.access$100(paramWildcardType.getUpperBounds()));
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */