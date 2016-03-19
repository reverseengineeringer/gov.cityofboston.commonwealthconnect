package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.concurrent.TimeUnit;

@Beta
public final class AbstractScheduledService$CustomScheduler$Schedule
{
  private final long delay;
  private final TimeUnit unit;
  
  public AbstractScheduledService$CustomScheduler$Schedule(long paramLong, TimeUnit paramTimeUnit)
  {
    delay = paramLong;
    unit = ((TimeUnit)Preconditions.checkNotNull(paramTimeUnit));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.CustomScheduler.Schedule
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */