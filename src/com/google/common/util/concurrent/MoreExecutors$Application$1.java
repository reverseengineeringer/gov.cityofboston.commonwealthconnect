package com.google.common.util.concurrent;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

class MoreExecutors$Application$1
  implements Runnable
{
  MoreExecutors$Application$1(MoreExecutors.Application paramApplication, ExecutorService paramExecutorService, long paramLong, TimeUnit paramTimeUnit) {}
  
  public void run()
  {
    try
    {
      val$service.shutdown();
      val$service.awaitTermination(val$terminationTimeout, val$timeUnit);
      return;
    }
    catch (InterruptedException localInterruptedException) {}
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.Application.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */