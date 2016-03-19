package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.util.Map;

final class TypeResolver$TypeMappingIntrospector
  extends TypeVisitor
{
  private static final TypeResolver.WildcardCapturer wildcardCapturer = new TypeResolver.WildcardCapturer(null);
  private final Map<TypeResolver.TypeVariableKey, Type> mappings = Maps.newHashMap();
  
  static ImmutableMap<TypeResolver.TypeVariableKey, Type> getTypeMappings(Type paramType)
  {
    TypeMappingIntrospector localTypeMappingIntrospector = new TypeMappingIntrospector();
    localTypeMappingIntrospector.visit(new Type[] { wildcardCapturer.capture(paramType) });
    return ImmutableMap.copyOf(mappings);
  }
  
  private void map(TypeResolver.TypeVariableKey paramTypeVariableKey, Type paramType)
  {
    if (mappings.containsKey(paramTypeVariableKey)) {
      return;
    }
    for (Type localType = paramType;; localType = (Type)mappings.get(TypeResolver.TypeVariableKey.forLookup(localType)))
    {
      if (localType == null) {
        break label72;
      }
      if (paramTypeVariableKey.equalsType(localType))
      {
        while (paramType != null) {
          paramType = (Type)mappings.remove(TypeResolver.TypeVariableKey.forLookup(paramType));
        }
        break;
      }
    }
    label72:
    mappings.put(paramTypeVariableKey, paramType);
  }
  
  void visitClass(Class<?> paramClass)
  {
    visit(new Type[] { paramClass.getGenericSuperclass() });
    visit(paramClass.getGenericInterfaces());
  }
  
  void visitParameterizedType(ParameterizedType paramParameterizedType)
  {
    Class localClass = (Class)paramParameterizedType.getRawType();
    TypeVariable[] arrayOfTypeVariable = localClass.getTypeParameters();
    Type[] arrayOfType = paramParameterizedType.getActualTypeArguments();
    if (arrayOfTypeVariable.length == arrayOfType.length) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool);
      int i = 0;
      while (i < arrayOfTypeVariable.length)
      {
        map(new TypeResolver.TypeVariableKey(arrayOfTypeVariable[i]), arrayOfType[i]);
        i += 1;
      }
    }
    visit(new Type[] { localClass });
    visit(new Type[] { paramParameterizedType.getOwnerType() });
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
 * Qualified Name:     com.google.common.reflect.TypeResolver.TypeMappingIntrospector
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */