package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@VisibleForTesting
class MoreExecutors$Application
{
  final void addDelayedShutdownHook(final ExecutorService paramExecutorService, final long paramLong, TimeUnit paramTimeUnit)
  {
    Preconditions.checkNotNull(paramExecutorService);
    Preconditions.checkNotNull(paramTimeUnit);
    addShutdownHook(MoreExecutors.newThread("DelayedShutdownHook-for-" + paramExecutorService, new Runnable()
    {
      public void run()
      {
        try
        {
          paramExecutorService.shutdown();
          paramExecutorService.awaitTermination(paramLong, val$timeUnit);
          return;
        }
        catch (InterruptedException localInterruptedException) {}
      }
    }));
  }
  
  @VisibleForTesting
  void addShutdownHook(Thread paramThread)
  {
    Runtime.getRuntime().addShutdownHook(paramThread);
  }
  
  final ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor)
  {
    return getExitingExecutorService(paramThreadPoolExecutor, 120L, TimeUnit.SECONDS);
  }
  
  final ExecutorService getExitingExecutorService(ThreadPoolExecutor paramThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    MoreExecutors.access$000(paramThreadPoolExecutor);
    paramThreadPoolExecutor = Executors.unconfigurableExecutorService(paramThreadPoolExecutor);
    addDelayedShutdownHook(paramThreadPoolExecutor, paramLong, paramTimeUnit);
    return paramThreadPoolExecutor;
  }
  
  final ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
  {
    return getExitingScheduledExecutorService(paramScheduledThreadPoolExecutor, 120L, TimeUnit.SECONDS);
  }
  
  final ScheduledExecutorService getExitingScheduledExecutorService(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor, long paramLong, TimeUnit paramTimeUnit)
  {
    MoreExecutors.access$000(paramScheduledThreadPoolExecutor);
    paramScheduledThreadPoolExecutor = Executors.unconfigurableScheduledExecutorService(paramScheduledThreadPoolExecutor);
    addDelayedShutdownHook(paramScheduledThreadPoolExecutor, paramLong, paramTimeUnit);
    return paramScheduledThreadPoolExecutor;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.Application
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */