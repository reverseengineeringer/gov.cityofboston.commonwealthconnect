package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Ticker;
import java.util.concurrent.TimeUnit;
import javax.annotation.concurrent.ThreadSafe;

@Beta
@ThreadSafe
public abstract class RateLimiter
{
  double maxPermits;
  private final Object mutex = new Object();
  private long nextFreeTicketMicros = 0L;
  private final long offsetNanos;
  volatile double stableIntervalMicros;
  double storedPermits;
  private final SleepingTicker ticker;
  
  private RateLimiter(SleepingTicker paramSleepingTicker)
  {
    ticker = paramSleepingTicker;
    offsetNanos = paramSleepingTicker.read();
  }
  
  private static void checkPermits(int paramInt)
  {
    if (paramInt > 0) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Requested permits must be positive");
      return;
    }
  }
  
  public static RateLimiter create(double paramDouble)
  {
    return create(SleepingTicker.SYSTEM_TICKER, paramDouble);
  }
  
  public static RateLimiter create(double paramDouble, long paramLong, TimeUnit paramTimeUnit)
  {
    return create(SleepingTicker.SYSTEM_TICKER, paramDouble, paramLong, paramTimeUnit);
  }
  
  @VisibleForTesting
  static RateLimiter create(SleepingTicker paramSleepingTicker, double paramDouble)
  {
    paramSleepingTicker = new Bursty(paramSleepingTicker, 1.0D);
    paramSleepingTicker.setRate(paramDouble);
    return paramSleepingTicker;
  }
  
  @VisibleForTesting
  static RateLimiter create(SleepingTicker paramSleepingTicker, double paramDouble, long paramLong, TimeUnit paramTimeUnit)
  {
    paramSleepingTicker = new WarmingUp(paramSleepingTicker, paramLong, paramTimeUnit);
    paramSleepingTicker.setRate(paramDouble);
    return paramSleepingTicker;
  }
  
  @VisibleForTesting
  static RateLimiter createWithCapacity(SleepingTicker paramSleepingTicker, double paramDouble, long paramLong, TimeUnit paramTimeUnit)
  {
    paramSleepingTicker = new Bursty(paramSleepingTicker, paramTimeUnit.toNanos(paramLong) / 1.0E9D);
    paramSleepingTicker.setRate(paramDouble);
    return paramSleepingTicker;
  }
  
  private long readSafeMicros()
  {
    return TimeUnit.NANOSECONDS.toMicros(ticker.read() - offsetNanos);
  }
  
  private long reserveNextTicket(double paramDouble, long paramLong)
  {
    resync(paramLong);
    paramLong = Math.max(0L, nextFreeTicketMicros - paramLong);
    double d = Math.min(paramDouble, storedPermits);
    long l1 = storedPermitsToWaitTime(storedPermits, d);
    long l2 = (stableIntervalMicros * (paramDouble - d));
    nextFreeTicketMicros += l1 + l2;
    storedPermits -= d;
    return paramLong;
  }
  
  private void resync(long paramLong)
  {
    if (paramLong > nextFreeTicketMicros)
    {
      storedPermits = Math.min(maxPermits, storedPermits + (paramLong - nextFreeTicketMicros) / stableIntervalMicros);
      nextFreeTicketMicros = paramLong;
    }
  }
  
  public double acquire()
  {
    return acquire(1);
  }
  
  public double acquire(int paramInt)
  {
    long l = reserve(paramInt);
    ticker.sleepMicrosUninterruptibly(l);
    return 1.0D * l / TimeUnit.SECONDS.toMicros(1L);
  }
  
  abstract void doSetRate(double paramDouble1, double paramDouble2);
  
  public final double getRate()
  {
    return TimeUnit.SECONDS.toMicros(1L) / stableIntervalMicros;
  }
  
  long reserve()
  {
    return reserve(1);
  }
  
  long reserve(int paramInt)
  {
    checkPermits(paramInt);
    Object localObject1 = mutex;
    double d = paramInt;
    try
    {
      long l = reserveNextTicket(d, readSafeMicros());
      return l;
    }
    finally {}
  }
  
  public final void setRate(double paramDouble)
  {
    if ((paramDouble > 0.0D) && (!Double.isNaN(paramDouble))) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "rate must be positive");
      synchronized (mutex)
      {
        resync(readSafeMicros());
        double d = TimeUnit.SECONDS.toMicros(1L) / paramDouble;
        stableIntervalMicros = d;
        doSetRate(paramDouble, d);
        return;
      }
    }
  }
  
  abstract long storedPermitsToWaitTime(double paramDouble1, double paramDouble2);
  
  public String toString()
  {
    return String.format("RateLimiter[stableRate=%3.1fqps]", new Object[] { Double.valueOf(1000000.0D / stableIntervalMicros) });
  }
  
  public boolean tryAcquire()
  {
    return tryAcquire(1, 0L, TimeUnit.MICROSECONDS);
  }
  
  public boolean tryAcquire(int paramInt)
  {
    return tryAcquire(paramInt, 0L, TimeUnit.MICROSECONDS);
  }
  
  public boolean tryAcquire(int paramInt, long paramLong, TimeUnit arg4)
  {
    paramLong = ???.toMicros(paramLong);
    checkPermits(paramInt);
    synchronized (mutex)
    {
      long l = readSafeMicros();
      if (nextFreeTicketMicros > l + paramLong) {
        return false;
      }
      paramLong = reserveNextTicket(paramInt, l);
      ticker.sleepMicrosUninterruptibly(paramLong);
      return true;
    }
  }
  
  public boolean tryAcquire(long paramLong, TimeUnit paramTimeUnit)
  {
    return tryAcquire(1, paramLong, paramTimeUnit);
  }
  
  private static class Bursty
    extends RateLimiter
  {
    final double maxBurstSeconds;
    
    Bursty(RateLimiter.SleepingTicker paramSleepingTicker, double paramDouble)
    {
      super(null);
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
  
  @VisibleForTesting
  static abstract class SleepingTicker
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
  
  private static class WarmingUp
    extends RateLimiter
  {
    private double halfPermits;
    private double slope;
    final long warmupPeriodMicros;
    
    WarmingUp(RateLimiter.SleepingTicker paramSleepingTicker, long paramLong, TimeUnit paramTimeUnit)
    {
      super(null);
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
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.RateLimiter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */