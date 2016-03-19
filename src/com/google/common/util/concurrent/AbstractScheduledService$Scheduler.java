package com.google.common.util.concurrent;

import java.util.concurrent.Future;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

public abstract class AbstractScheduledService$Scheduler
{
  public static Scheduler newFixedDelaySchedule(long paramLong1, long paramLong2, final TimeUnit paramTimeUnit)
  {
    new Scheduler(paramLong1)
    {
      public Future<?> schedule(AbstractService paramAnonymousAbstractService, ScheduledExecutorService paramAnonymousScheduledExecutorService, Runnable paramAnonymousRunnable)
      {
        return paramAnonymousScheduledExecutorService.scheduleWithFixedDelay(paramAnonymousRunnable, val$initialDelay, paramTimeUnit, val$unit);
      }
    };
  }
  
  public static Scheduler newFixedRateSchedule(long paramLong1, long paramLong2, final TimeUnit paramTimeUnit)
  {
    new Scheduler(paramLong1)
    {
      public Future<?> schedule(AbstractService paramAnonymousAbstractService, ScheduledExecutorService paramAnonymousScheduledExecutorService, Runnable paramAnonymousRunnable)
      {
        return paramAnonymousScheduledExecutorService.scheduleAtFixedRate(paramAnonymousRunnable, val$initialDelay, paramTimeUnit, val$unit);
      }
    };
  }
  
  abstract Future<?> schedule(AbstractService paramAbstractService, ScheduledExecutorService paramScheduledExecutorService, Runnable paramRunnable);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.Scheduler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */