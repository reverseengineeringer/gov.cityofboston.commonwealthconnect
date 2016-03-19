package com.google.common.reflect;

import java.lang.annotation.Annotation;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import javax.annotation.Nullable;

class Invokable$MethodInvokable<T>
  extends Invokable<T, Object>
{
  final Method method;
  
  Invokable$MethodInvokable(Method paramMethod)
  {
    super(paramMethod);
    method = paramMethod;
  }
  
  Type[] getGenericExceptionTypes()
  {
    return method.getGenericExceptionTypes();
  }
  
  Type[] getGenericParameterTypes()
  {
    return method.getGenericParameterTypes();
  }
  
  Type getGenericReturnType()
  {
    return method.getGenericReturnType();
  }
  
  final Annotation[][] getParameterAnnotations()
  {
    return method.getParameterAnnotations();
  }
  
  public final TypeVariable<?>[] getTypeParameters()
  {
    return method.getTypeParameters();
  }
  
  final Object invokeInternal(@Nullable Object paramObject, Object[] paramArrayOfObject)
    throws InvocationTargetException, IllegalAccessException
  {
    return method.invoke(paramObject, paramArrayOfObject);
  }
  
  public final boolean isOverridable()
  {
    return (!isFinal()) && (!isPrivate()) && (!isStatic()) && (!Modifier.isFinal(getDeclaringClass().getModifiers()));
  }
  
  public final boolean isVarArgs()
  {
    return method.isVarArgs();
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.Invokable.MethodInvokable
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */