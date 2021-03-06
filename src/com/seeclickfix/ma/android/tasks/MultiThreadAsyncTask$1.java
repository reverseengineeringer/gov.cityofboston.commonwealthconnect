package com.seeclickfix.ma.android.tasks;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

final class MultiThreadAsyncTask$1
  implements ThreadFactory
{
  private final AtomicInteger mCount = new AtomicInteger(1);
  
  public Thread newThread(Runnable paramRunnable)
  {
    return new Thread(paramRunnable, "MultiThreadAsyncTask #" + mCount.getAndIncrement());
  }
}

/* Location:
 * Qualified Name:     com.seeclickfix.ma.android.tasks.MultiThreadAsyncTask.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */