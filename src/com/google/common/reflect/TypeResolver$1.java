package com.google.common.reflect;

import com.google.common.base.Preconditions;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Map;

final class TypeResolver$1
  extends TypeVisitor
{
  TypeResolver$1(Map paramMap, Type paramType) {}
  
  void visitClass(Class<?> paramClass)
  {
    throw new IllegalArgumentException("No type mapping from " + paramClass);
  }
  
  void visitGenericArrayType(GenericArrayType paramGenericArrayType)
  {
    Type localType = Types.getComponentType(val$to);
    if (localType != null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "%s is not an array type.", new Object[] { val$to });
      TypeResolver.access$100(val$mappings, paramGenericArrayType.getGenericComponentType(), localType);
      return;
    }
  }
  
  void visitParameterizedType(ParameterizedType paramParameterizedType)
  {
    ParameterizedType localParameterizedType = (ParameterizedType)TypeResolver.access$000(ParameterizedType.class, val$to);
    Preconditions.checkArgument(paramParameterizedType.getRawType().equals(localParameterizedType.getRawType()), "Inconsistent raw type: %s vs. %s", new Object[] { paramParameterizedType, val$to });
    Type[] arrayOfType1 = paramParameterizedType.getActualTypeArguments();
    Type[] arrayOfType2 = localParameterizedType.getActualTypeArguments();
    if (arrayOfType1.length == arrayOfType2.length) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "%s not compatible with %s", new Object[] { paramParameterizedType, localParameterizedType });
      int i = 0;
      while (i < arrayOfType1.length)
      {
        TypeResolver.access$100(val$mappings, arrayOfType1[i], arrayOfType2[i]);
        i += 1;
      }
    }
  }
  
  void visitTypeVariable(TypeVariable<?> paramTypeVariable)
  {
    val$mappings.put(new TypeResolver.TypeVariableKey(paramTypeVariable), val$to);
  }
  
  void visitWildcardType(WildcardType paramWildcardType)
  {
    Object localObject = (WildcardType)TypeResolver.access$000(WildcardType.class, val$to);
    Type[] arrayOfType1 = paramWildcardType.getUpperBounds();
    Type[] arrayOfType2 = ((WildcardType)localObject).getUpperBounds();
    Type[] arrayOfType3 = paramWildcardType.getLowerBounds();
    localObject = ((WildcardType)localObject).getLowerBounds();
    if ((arrayOfType1.length == arrayOfType2.length) && (arrayOfType3.length == localObject.length)) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Incompatible type: %s vs. %s", new Object[] { paramWildcardType, val$to });
      i = 0;
      while (i < arrayOfType1.length)
      {
        TypeResolver.access$100(val$mappings, arrayOfType1[i], arrayOfType2[i]);
        i += 1;
      }
    }
    int i = 0;
    while (i < arrayOfType3.length)
    {
      TypeResolver.access$100(val$mappings, arrayOfType3[i], localObject[i]);
      i += 1;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeResolver.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */