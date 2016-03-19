package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

public final class ThreadFactoryBuilder
{
  private ThreadFactory backingThreadFactory = null;
  private Boolean daemon = null;
  private String nameFormat = null;
  private Integer priority = null;
  private Thread.UncaughtExceptionHandler uncaughtExceptionHandler = null;
  
  private static ThreadFactory build(ThreadFactoryBuilder paramThreadFactoryBuilder)
  {
    final String str = nameFormat;
    final Boolean localBoolean = daemon;
    final Integer localInteger = priority;
    final Thread.UncaughtExceptionHandler localUncaughtExceptionHandler = uncaughtExceptionHandler;
    if (backingThreadFactory != null)
    {
      paramThreadFactoryBuilder = backingThreadFactory;
      if (str == null) {
        break label70;
      }
    }
    label70:
    for (final AtomicLong localAtomicLong = new AtomicLong(0L);; localAtomicLong = null)
    {
      new ThreadFactory()
      {
        public Thread newThread(Runnable paramAnonymousRunnable)
        {
          paramAnonymousRunnable = val$backingThreadFactory.newThread(paramAnonymousRunnable);
          if (str != null) {
            paramAnonymousRunnable.setName(String.format(str, new Object[] { Long.valueOf(localAtomicLong.getAndIncrement()) }));
          }
          if (localBoolean != null) {
            paramAnonymousRunnable.setDaemon(localBoolean.booleanValue());
          }
          if (localInteger != null) {
            paramAnonymousRunnable.setPriority(localInteger.intValue());
          }
          if (localUncaughtExceptionHandler != null) {
            paramAnonymousRunnable.setUncaughtExceptionHandler(localUncaughtExceptionHandler);
          }
          return paramAnonymousRunnable;
        }
      };
      paramThreadFactoryBuilder = Executors.defaultThreadFactory();
      break;
    }
  }
  
  public ThreadFactory build()
  {
    return build(this);
  }
  
  public ThreadFactoryBuilder setDaemon(boolean paramBoolean)
  {
    daemon = Boolean.valueOf(paramBoolean);
    return this;
  }
  
  public ThreadFactoryBuilder setNameFormat(String paramString)
  {
    String.format(paramString, new Object[] { Integer.valueOf(0) });
    nameFormat = paramString;
    return this;
  }
  
  public ThreadFactoryBuilder setPriority(int paramInt)
  {
    if (paramInt >= 1)
    {
      bool = true;
      Preconditions.checkArgument(bool, "Thread priority (%s) must be >= %s", new Object[] { Integer.valueOf(paramInt), Integer.valueOf(1) });
      if (paramInt > 10) {
        break label79;
      }
    }
    label79:
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "Thread priority (%s) must be <= %s", new Object[] { Integer.valueOf(paramInt), Integer.valueOf(10) });
      priority = Integer.valueOf(paramInt);
      return this;
      bool = false;
      break;
    }
  }
  
  public ThreadFactoryBuilder setThreadFactory(ThreadFactory paramThreadFactory)
  {
    backingThreadFactory = ((ThreadFactory)Preconditions.checkNotNull(paramThreadFactory));
    return this;
  }
  
  public ThreadFactoryBuilder setUncaughtExceptionHandler(Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler)
  {
    uncaughtExceptionHandler = ((Thread.UncaughtExceptionHandler)Preconditions.checkNotNull(paramUncaughtExceptionHandler));
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ThreadFactoryBuilder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */