package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.annotation.Nullable;

class EventSubscriber
{
  private final Method method;
  private final Object target;
  
  EventSubscriber(Object paramObject, Method paramMethod)
  {
    Preconditions.checkNotNull(paramObject, "EventSubscriber target cannot be null.");
    Preconditions.checkNotNull(paramMethod, "EventSubscriber method cannot be null.");
    target = paramObject;
    method = paramMethod;
    paramMethod.setAccessible(true);
  }
  
  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof EventSubscriber))
    {
      paramObject = (EventSubscriber)paramObject;
      bool1 = bool2;
      if (target == target)
      {
        bool1 = bool2;
        if (method.equals(method)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public Method getMethod()
  {
    return method;
  }
  
  public Object getSubscriber()
  {
    return target;
  }
  
  public void handleEvent(Object paramObject)
    throws InvocationTargetException
  {
    Preconditions.checkNotNull(paramObject);
    try
    {
      method.invoke(target, new Object[] { paramObject });
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw new Error("Method rejected target/argument: " + paramObject, localIllegalArgumentException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new Error("Method became inaccessible: " + paramObject, localIllegalAccessException);
    }
    catch (InvocationTargetException paramObject)
    {
      if ((((InvocationTargetException)paramObject).getCause() instanceof Error)) {
        throw ((Error)((InvocationTargetException)paramObject).getCause());
      }
      throw ((Throwable)paramObject);
    }
  }
  
  public int hashCode()
  {
    return (method.hashCode() + 31) * 31 + System.identityHashCode(target);
  }
  
  public String toString()
  {
    return "[wrapper " + method + "]";
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.EventSubscriber
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */