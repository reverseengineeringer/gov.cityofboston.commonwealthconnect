package com.google.common.util.concurrent;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

final class ThreadFactoryBuilder$1
  implements ThreadFactory
{
  ThreadFactoryBuilder$1(ThreadFactory paramThreadFactory, String paramString, AtomicLong paramAtomicLong, Boolean paramBoolean, Integer paramInteger, Thread.UncaughtExceptionHandler paramUncaughtExceptionHandler) {}
  
  public Thread newThread(Runnable paramRunnable)
  {
    paramRunnable = val$backingThreadFactory.newThread(paramRunnable);
    if (val$nameFormat != null) {
      paramRunnable.setName(String.format(val$nameFormat, new Object[] { Long.valueOf(val$count.getAndIncrement()) }));
    }
    if (val$daemon != null) {
      paramRunnable.setDaemon(val$daemon.booleanValue());
    }
    if (val$priority != null) {
      paramRunnable.setPriority(val$priority.intValue());
    }
    if (val$uncaughtExceptionHandler != null) {
      paramRunnable.setUncaughtExceptionHandler(val$uncaughtExceptionHandler);
    }
    return paramRunnable;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ThreadFactoryBuilder.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */