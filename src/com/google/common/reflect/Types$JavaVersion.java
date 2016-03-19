package com.google.common.reflect;

import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;
import java.lang.reflect.GenericArrayType;
import java.lang.reflect.Type;

 enum Types$JavaVersion
{
  static final JavaVersion CURRENT;
  
  static
  {
    $VALUES = new JavaVersion[] { JAVA6, JAVA7 };
    if ((new TypeCapture() {}.capture() instanceof Class)) {}
    for (JavaVersion localJavaVersion = JAVA7;; localJavaVersion = JAVA6)
    {
      CURRENT = localJavaVersion;
      return;
    }
  }
  
  private Types$JavaVersion() {}
  
  abstract Type newArrayType(Type paramType);
  
  final ImmutableList<Type> usedInGenericType(Type[] paramArrayOfType)
  {
    ImmutableList.Builder localBuilder = ImmutableList.builder();
    int j = paramArrayOfType.length;
    int i = 0;
    while (i < j)
    {
      localBuilder.add(usedInGenericType(paramArrayOfType[i]));
      i += 1;
    }
    return localBuilder.build();
  }
  
  abstract Type usedInGenericType(Type paramType);
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Types.JavaVersion
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */