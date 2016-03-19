package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Ticker;
import java.util.concurrent.TimeUnit;

@VisibleForTesting
abstract class RateLimiter$SleepingTicker
  extends Ticker
{
  static final SleepingTicker SYSTEM_TICKER = new SleepingTicker()
  {
    public long read()
    {
      return systemTicker().read();
    }
    
    public void sleepMicrosUninterruptibly(long paramAnonymousLong)
    {
      if (paramAnonymousLong > 0L) {
        Uninterruptibles.sleepUninterruptibly(paramAnonymousLong, TimeUnit.MICROSECONDS);
      }
    }
  };
  
  abstract void sleepMicrosUninterruptibly(long paramLong);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.RateLimiter.SleepingTicker
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */