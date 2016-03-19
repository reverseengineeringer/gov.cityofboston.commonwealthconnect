package com.google.common.util.concurrent;

class RateLimiter$Bursty
  extends RateLimiter
{
  final double maxBurstSeconds;
  
  RateLimiter$Bursty(RateLimiter.SleepingTicker paramSleepingTicker, double paramDouble)
  {
    super(paramSleepingTicker, null);
    maxBurstSeconds = paramDouble;
  }
  
  void doSetRate(double paramDouble1, double paramDouble2)
  {
    paramDouble2 = 0.0D;
    double d = maxPermits;
    maxPermits = (maxBurstSeconds * paramDouble1);
    if (d == 0.0D) {}
    for (paramDouble1 = paramDouble2;; paramDouble1 = storedPermits * maxPermits / d)
    {
      storedPermits = paramDouble1;
      return;
    }
  }
  
  long storedPermitsToWaitTime(double paramDouble1, double paramDouble2)
  {
    return 0L;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.RateLimiter.Bursty
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */