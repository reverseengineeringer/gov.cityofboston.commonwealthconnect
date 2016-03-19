package com.google.common.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.util.Arrays;
import javax.annotation.Nullable;

class Invokable$ConstructorInvokable<T>
  extends Invokable<T, T>
{
  final Constructor<?> constructor;
  
  Invokable$ConstructorInvokable(Constructor<?> paramConstructor)
  {
    super(paramConstructor);
    constructor = paramConstructor;
  }
  
  private boolean mayNeedHiddenThis()
  {
    Class localClass = constructor.getDeclaringClass();
    if (localClass.getEnclosingConstructor() != null) {}
    do
    {
      Method localMethod;
      do
      {
        return true;
        localMethod = localClass.getEnclosingMethod();
        if (localMethod == null) {
          break;
        }
      } while (!Modifier.isStatic(localMethod.getModifiers()));
      return false;
    } while ((localClass.getEnclosingClass() != null) && (!Modifier.isStatic(localClass.getModifiers())));
    return false;
  }
  
  Type[] getGenericExceptionTypes()
  {
    return constructor.getGenericExceptionTypes();
  }
  
  Type[] getGenericParameterTypes()
  {
    Type[] arrayOfType = constructor.getGenericParameterTypes();
    if ((arrayOfType.length > 0) && (mayNeedHiddenThis()))
    {
      Class[] arrayOfClass = constructor.getParameterTypes();
      if ((arrayOfType.length == arrayOfClass.length) && (arrayOfClass[0] == getDeclaringClass().getEnclosingClass())) {
        return (Type[])Arrays.copyOfRange(arrayOfType, 1, arrayOfType.length);
      }
    }
    return arrayOfType;
  }
  
  Type getGenericReturnType()
  {
    Class localClass = getDeclaringClass();
    TypeVariable[] arrayOfTypeVariable = localClass.getTypeParameters();
    Object localObject = localClass;
    if (arrayOfTypeVariable.length > 0) {
      localObject = Types.newParameterizedType(localClass, arrayOfTypeVariable);
    }
    return (Type)localObject;
  }
  
  final Annotation[][] getParameterAnnotations()
  {
    return constructor.getParameterAnnotations();
  }
  
  public final TypeVariable<?>[] getTypeParameters()
  {
    TypeVariable[] arrayOfTypeVariable1 = getDeclaringClass().getTypeParameters();
    TypeVariable[] arrayOfTypeVariable2 = constructor.getTypeParameters();
    TypeVariable[] arrayOfTypeVariable3 = new TypeVariable[arrayOfTypeVariable1.length + arrayOfTypeVariable2.length];
    System.arraycopy(arrayOfTypeVariable1, 0, arrayOfTypeVariable3, 0, arrayOfTypeVariable1.length);
    System.arraycopy(arrayOfTypeVariable2, 0, arrayOfTypeVariable3, arrayOfTypeVariable1.length, arrayOfTypeVariable2.length);
    return arrayOfTypeVariable3;
  }
  
  final Object invokeInternal(@Nullable Object paramObject, Object[] paramArrayOfObject)
    throws InvocationTargetException, IllegalAccessException
  {
    try
    {
      paramObject = constructor.newInstance(paramArrayOfObject);
      return paramObject;
    }
    catch (InstantiationException paramObject)
    {
      throw new RuntimeException(constructor + " failed.", (Throwable)paramObject);
    }
  }
  
  public final boolean isOverridable()
  {
    return false;
  }
  
  public final boolean isVarArgs()
  {
    return constructor.isVarArgs();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Invokable.ConstructorInvokable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */