package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class TypeResolver$TypeTable
{
  private final ImmutableMap<TypeResolver.TypeVariableKey, Type> map;
  
  TypeResolver$TypeTable()
  {
    map = ImmutableMap.of();
  }
  
  private TypeResolver$TypeTable(ImmutableMap<TypeResolver.TypeVariableKey, Type> paramImmutableMap)
  {
    map = paramImmutableMap;
  }
  
  final Type resolve(final TypeVariable<?> paramTypeVariable)
  {
    resolveInternal(paramTypeVariable, new TypeTable()
    {
      public Type resolveInternal(TypeVariable<?> paramAnonymousTypeVariable, TypeResolver.TypeTable paramAnonymousTypeTable)
      {
        if (paramAnonymousTypeVariable.getGenericDeclaration().equals(paramTypeVariable.getGenericDeclaration())) {
          return paramAnonymousTypeVariable;
        }
        return jdField_this.resolveInternal(paramAnonymousTypeVariable, paramAnonymousTypeTable);
      }
    });
  }
  
  Type resolveInternal(TypeVariable<?> paramTypeVariable, TypeTable paramTypeTable)
  {
    Object localObject = (Type)map.get(new TypeResolver.TypeVariableKey(paramTypeVariable));
    if (localObject == null)
    {
      localObject = paramTypeVariable.getBounds();
      if (localObject.length == 0) {}
      do
      {
        return paramTypeVariable;
        paramTypeTable = TypeResolver.access$300(new TypeResolver(paramTypeTable, null), (Type[])localObject);
      } while ((Types.NativeTypeVariableEquals.NATIVE_TYPE_VARIABLE_ONLY) && (Arrays.equals((Object[])localObject, paramTypeTable)));
      return Types.newArtificialTypeVariable(paramTypeVariable.getGenericDeclaration(), paramTypeVariable.getName(), paramTypeTable);
    }
    return new TypeResolver(paramTypeTable, null).resolveType((Type)localObject);
  }
  
  final TypeTable where(Map<TypeResolver.TypeVariableKey, ? extends Type> paramMap)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    localBuilder.putAll(map);
    paramMap = paramMap.entrySet().iterator();
    if (paramMap.hasNext())
    {
      Object localObject = (Map.Entry)paramMap.next();
      TypeResolver.TypeVariableKey localTypeVariableKey = (TypeResolver.TypeVariableKey)((Map.Entry)localObject).getKey();
      localObject = (Type)((Map.Entry)localObject).getValue();
      if (!localTypeVariableKey.equalsType((Type)localObject)) {}
      for (boolean bool = true;; bool = false)
      {
        Preconditions.checkArgument(bool, "Type variable %s bound to itself", new Object[] { localTypeVariableKey });
        localBuilder.put(localTypeVariableKey, localObject);
        break;
      }
    }
    return new TypeTable(localBuilder.build());
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.TypeResolver.TypeTable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */