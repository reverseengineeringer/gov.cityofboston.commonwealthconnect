package com.google.common.util.concurrent;

import com.google.common.base.Ticker;
import java.util.concurrent.TimeUnit;

final class RateLimiter$SleepingTicker$1
  extends RateLimiter.SleepingTicker
{
  public long read()
  {
    return systemTicker().read();
  }
  
  public void sleepMicrosUninterruptibly(long paramLong)
  {
    if (paramLong > 0L) {
      Uninterruptibles.sleepUninterruptibly(paramLong, TimeUnit.MICROSECONDS);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.RateLimiter.SleepingTicker.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */