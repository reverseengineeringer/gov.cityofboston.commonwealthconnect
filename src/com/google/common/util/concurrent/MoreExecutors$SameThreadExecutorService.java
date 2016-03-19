package com.google.common.util.concurrent;

import java.util.Collections;
import java.util.List;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

class MoreExecutors$SameThreadExecutorService
  extends AbstractListeningExecutorService
{
  private final Lock lock = new ReentrantLock();
  private int runningTasks = 0;
  private boolean shutdown = false;
  private final Condition termination = lock.newCondition();
  
  private void endTask()
  {
    lock.lock();
    try
    {
      runningTasks -= 1;
      if (isTerminated()) {
        termination.signalAll();
      }
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  private void startTask()
  {
    lock.lock();
    try
    {
      if (isShutdown()) {
        throw new RejectedExecutionException("Executor already shutdown");
      }
    }
    finally
    {
      lock.unlock();
    }
    runningTasks += 1;
    lock.unlock();
  }
  
  /* Error */
  public boolean awaitTermination(long paramLong, java.util.concurrent.TimeUnit paramTimeUnit)
    throws java.lang.InterruptedException
  {
    // Byte code:
    //   0: aload_3
    //   1: lload_1
    //   2: invokevirtual 75	java/util/concurrent/TimeUnit:toNanos	(J)J
    //   5: lstore_1
    //   6: aload_0
    //   7: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   10: invokeinterface 42 1 0
    //   15: aload_0
    //   16: invokevirtual 46	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:isTerminated	()Z
    //   19: istore 4
    //   21: iload 4
    //   23: ifeq +14 -> 37
    //   26: aload_0
    //   27: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   30: invokeinterface 54 1 0
    //   35: iconst_1
    //   36: ireturn
    //   37: lload_1
    //   38: lconst_0
    //   39: lcmp
    //   40: ifgt +14 -> 54
    //   43: aload_0
    //   44: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   47: invokeinterface 54 1 0
    //   52: iconst_0
    //   53: ireturn
    //   54: aload_0
    //   55: getfield 32	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:termination	Ljava/util/concurrent/locks/Condition;
    //   58: lload_1
    //   59: invokeinterface 78 3 0
    //   64: lstore_1
    //   65: goto -50 -> 15
    //   68: astore_3
    //   69: aload_0
    //   70: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   73: invokeinterface 54 1 0
    //   78: aload_3
    //   79: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	80	0	this	SameThreadExecutorService
    //   0	80	1	paramLong	long
    //   0	80	3	paramTimeUnit	java.util.concurrent.TimeUnit
    //   19	3	4	bool	boolean
    // Exception table:
    //   from	to	target	type
    //   15	21	68	finally
    //   54	65	68	finally
  }
  
  public void execute(Runnable paramRunnable)
  {
    startTask();
    try
    {
      paramRunnable.run();
      return;
    }
    finally
    {
      endTask();
    }
  }
  
  public boolean isShutdown()
  {
    lock.lock();
    try
    {
      boolean bool = shutdown;
      return bool;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  /* Error */
  public boolean isTerminated()
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   4: invokeinterface 42 1 0
    //   9: aload_0
    //   10: getfield 36	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:shutdown	Z
    //   13: ifeq +25 -> 38
    //   16: aload_0
    //   17: getfield 34	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:runningTasks	I
    //   20: istore_1
    //   21: iload_1
    //   22: ifne +16 -> 38
    //   25: iconst_1
    //   26: istore_2
    //   27: aload_0
    //   28: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   31: invokeinterface 54 1 0
    //   36: iload_2
    //   37: ireturn
    //   38: iconst_0
    //   39: istore_2
    //   40: goto -13 -> 27
    //   43: astore_3
    //   44: aload_0
    //   45: getfield 24	com/google/common/util/concurrent/MoreExecutors$SameThreadExecutorService:lock	Ljava/util/concurrent/locks/Lock;
    //   48: invokeinterface 54 1 0
    //   53: aload_3
    //   54: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	55	0	this	SameThreadExecutorService
    //   20	2	1	i	int
    //   26	14	2	bool	boolean
    //   43	11	3	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   9	21	43	finally
  }
  
  public void shutdown()
  {
    lock.lock();
    try
    {
      shutdown = true;
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public List<Runnable> shutdownNow()
  {
    shutdown();
    return Collections.emptyList();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.SameThreadExecutorService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */