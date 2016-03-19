package com.google.common.util.concurrent;

import java.util.concurrent.TimeUnit;

class RateLimiter$WarmingUp
  extends RateLimiter
{
  private double halfPermits;
  private double slope;
  final long warmupPeriodMicros;
  
  RateLimiter$WarmingUp(RateLimiter.SleepingTicker paramSleepingTicker, long paramLong, TimeUnit paramTimeUnit)
  {
    super(paramSleepingTicker, null);
    warmupPeriodMicros = paramTimeUnit.toMicros(paramLong);
  }
  
  private double permitsToTime(double paramDouble)
  {
    return stableIntervalMicros + slope * paramDouble;
  }
  
  void doSetRate(double paramDouble1, double paramDouble2)
  {
    paramDouble1 = maxPermits;
    maxPermits = (warmupPeriodMicros / paramDouble2);
    halfPermits = (maxPermits / 2.0D);
    slope = ((paramDouble2 * 3.0D - paramDouble2) / halfPermits);
    if (paramDouble1 == Double.POSITIVE_INFINITY)
    {
      storedPermits = 0.0D;
      return;
    }
    if (paramDouble1 == 0.0D) {}
    for (paramDouble1 = maxPermits;; paramDouble1 = storedPermits * maxPermits / paramDouble1)
    {
      storedPermits = paramDouble1;
      return;
    }
  }
  
  long storedPermitsToWaitTime(double paramDouble1, double paramDouble2)
  {
    double d = paramDouble1 - halfPermits;
    long l = 0L;
    paramDouble1 = paramDouble2;
    if (d > 0.0D)
    {
      paramDouble1 = Math.min(d, paramDouble2);
      l = ((permitsToTime(d) + permitsToTime(d - paramDouble1)) * paramDouble1 / 2.0D);
      paramDouble1 = paramDouble2 - paramDouble1;
    }
    return (l + stableIntervalMicros * paramDouble1);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.RateLimiter.WarmingUp
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */