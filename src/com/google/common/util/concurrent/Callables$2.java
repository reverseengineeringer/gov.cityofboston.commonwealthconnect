package com.google.common.util.concurrent;

import com.google.common.base.Supplier;
import java.util.concurrent.Callable;

final class Callables$2
  implements Callable<T>
{
  Callables$2(Supplier paramSupplier, Callable paramCallable) {}
  
  public T call()
    throws Exception
  {
    Thread localThread = Thread.currentThread();
    String str = localThread.getName();
    boolean bool = Callables.access$000((String)val$nameSupplier.get(), localThread);
    try
    {
      Object localObject1 = val$callable.call();
      return (T)localObject1;
    }
    finally
    {
      if (bool) {
        Callables.access$000(str, localThread);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Callables.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */