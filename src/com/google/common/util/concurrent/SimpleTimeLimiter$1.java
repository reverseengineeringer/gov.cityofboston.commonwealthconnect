package com.google.common.util.concurrent;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.TimeUnit;

class SimpleTimeLimiter$1
  implements InvocationHandler
{
  SimpleTimeLimiter$1(SimpleTimeLimiter paramSimpleTimeLimiter, Object paramObject, long paramLong, TimeUnit paramTimeUnit, Set paramSet) {}
  
  public Object invoke(Object paramObject, final Method paramMethod, final Object[] paramArrayOfObject)
    throws Throwable
  {
    paramObject = new Callable()
    {
      public Object call()
        throws Exception
      {
        try
        {
          Object localObject = paramMethod.invoke(val$target, paramArrayOfObject);
          return localObject;
        }
        catch (InvocationTargetException localInvocationTargetException)
        {
          SimpleTimeLimiter.access$000(localInvocationTargetException, false);
          throw new AssertionError("can't get here");
        }
      }
    };
    return this$0.callWithTimeout((Callable)paramObject, val$timeoutDuration, val$timeoutUnit, val$interruptibleMethods.contains(paramMethod));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.SimpleTimeLimiter.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */