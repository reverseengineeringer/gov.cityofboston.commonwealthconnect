package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import java.util.concurrent.TimeUnit;

@Beta
@GwtCompatible(emulated=true)
public final class Stopwatch
{
  private long elapsedNanos;
  private boolean isRunning;
  private long startTick;
  private final Ticker ticker;
  
  @Deprecated
  Stopwatch()
  {
    this(Ticker.systemTicker());
  }
  
  @Deprecated
  Stopwatch(Ticker paramTicker)
  {
    ticker = ((Ticker)Preconditions.checkNotNull(paramTicker, "ticker"));
  }
  
  private static String abbreviate(TimeUnit paramTimeUnit)
  {
    switch (paramTimeUnit)
    {
    default: 
      throw new AssertionError();
    case ???: 
      return "ns";
    case ???: 
      return "μs";
    case ???: 
      return "ms";
    case ???: 
      return "s";
    case ???: 
      return "min";
    case ???: 
      return "h";
    }
    return "d";
  }
  
  private static TimeUnit chooseUnit(long paramLong)
  {
    if (TimeUnit.DAYS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L) {
      return TimeUnit.DAYS;
    }
    if (TimeUnit.HOURS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L) {
      return TimeUnit.HOURS;
    }
    if (TimeUnit.MINUTES.convert(paramLong, TimeUnit.NANOSECONDS) > 0L) {
      return TimeUnit.MINUTES;
    }
    if (TimeUnit.SECONDS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L) {
      return TimeUnit.SECONDS;
    }
    if (TimeUnit.MILLISECONDS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L) {
      return TimeUnit.MILLISECONDS;
    }
    if (TimeUnit.MICROSECONDS.convert(paramLong, TimeUnit.NANOSECONDS) > 0L) {
      return TimeUnit.MICROSECONDS;
    }
    return TimeUnit.NANOSECONDS;
  }
  
  public static Stopwatch createStarted()
  {
    return new Stopwatch().start();
  }
  
  public static Stopwatch createStarted(Ticker paramTicker)
  {
    return new Stopwatch(paramTicker).start();
  }
  
  public static Stopwatch createUnstarted()
  {
    return new Stopwatch();
  }
  
  public static Stopwatch createUnstarted(Ticker paramTicker)
  {
    return new Stopwatch(paramTicker);
  }
  
  private long elapsedNanos()
  {
    if (isRunning) {
      return ticker.read() - startTick + elapsedNanos;
    }
    return elapsedNanos;
  }
  
  public long elapsed(TimeUnit paramTimeUnit)
  {
    return paramTimeUnit.convert(elapsedNanos(), TimeUnit.NANOSECONDS);
  }
  
  public boolean isRunning()
  {
    return isRunning;
  }
  
  public Stopwatch reset()
  {
    elapsedNanos = 0L;
    isRunning = false;
    return this;
  }
  
  public Stopwatch start()
  {
    if (!isRunning) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkState(bool, "This stopwatch is already running.");
      isRunning = true;
      startTick = ticker.read();
      return this;
    }
  }
  
  public Stopwatch stop()
  {
    long l = ticker.read();
    Preconditions.checkState(isRunning, "This stopwatch is already stopped.");
    isRunning = false;
    elapsedNanos += l - startTick;
    return this;
  }
  
  @GwtIncompatible("String.format()")
  public String toString()
  {
    long l = elapsedNanos();
    TimeUnit localTimeUnit = chooseUnit(l);
    return String.format("%.4g %s", new Object[] { Double.valueOf(l / TimeUnit.NANOSECONDS.convert(1L, localTimeUnit)), abbreviate(localTimeUnit) });
  }
}

/* Location:
 * Qualified Name:     com.google.common.base.Stopwatch
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */