package com.google.common.eventbus;

import com.google.common.base.Objects;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.List;
import javax.annotation.Nullable;

final class AnnotatedSubscriberFinder$MethodIdentifier
{
  private final String name;
  private final List<Class<?>> parameterTypes;
  
  AnnotatedSubscriberFinder$MethodIdentifier(Method paramMethod)
  {
    name = paramMethod.getName();
    parameterTypes = Arrays.asList(paramMethod.getParameterTypes());
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof MethodIdentifier))
    {
      paramObject = (MethodIdentifier)paramObject;
      bool1 = bool2;
      if (name.equals(name))
      {
        bool1 = bool2;
        if (parameterTypes.equals(parameterTypes)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return Objects.hashCode(new Object[] { name, parameterTypes });
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.AnnotatedSubscriberFinder.MethodIdentifier
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */