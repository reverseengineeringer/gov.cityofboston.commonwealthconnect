package com.google.common.util.concurrent;

import com.google.common.base.Supplier;

final class Callables$3
  implements Runnable
{
  Callables$3(Supplier paramSupplier, Runnable paramRunnable) {}
  
  public void run()
  {
    Thread localThread = Thread.currentThread();
    String str = localThread.getName();
    boolean bool = Callables.access$000((String)val$nameSupplier.get(), localThread);
    try
    {
      val$task.run();
      return;
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
 * Qualified Name:     com.google.common.util.concurrent.Callables.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */