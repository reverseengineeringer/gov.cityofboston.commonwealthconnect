package com.google.common.util.concurrent;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.Callable;

class SimpleTimeLimiter$1$1
  implements Callable<Object>
{
  SimpleTimeLimiter$1$1(SimpleTimeLimiter.1 param1, Method paramMethod, Object[] paramArrayOfObject) {}
  
  public Object call()
    throws Exception
  {
    try
    {
      Object localObject = val$method.invoke(this$1.val$target, val$args);
      return localObject;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      SimpleTimeLimiter.access$000(localInvocationTargetException, false);
      throw new AssertionError("can't get here");
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.SimpleTimeLimiter.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */