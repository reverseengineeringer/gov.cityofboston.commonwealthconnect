package com.google.common.util.concurrent;

import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.util.concurrent.Executor;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

public final class ExecutionList
{
  @VisibleForTesting
  static final Logger log = Logger.getLogger(ExecutionList.class.getName());
  @GuardedBy("this")
  private boolean executed;
  @GuardedBy("this")
  private RunnableExecutorPair runnables;
  
  private static void executeListener(Runnable paramRunnable, Executor paramExecutor)
  {
    try
    {
      paramExecutor.execute(paramRunnable);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      log.log(Level.SEVERE, "RuntimeException while executing runnable " + paramRunnable + " with executor " + paramExecutor, localRuntimeException);
    }
  }
  
  public void add(Runnable paramRunnable, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramRunnable, "Runnable was null.");
    Preconditions.checkNotNull(paramExecutor, "Executor was null.");
    try
    {
      if (!executed)
      {
        runnables = new RunnableExecutorPair(paramRunnable, paramExecutor, runnables);
        return;
      }
      executeListener(paramRunnable, paramExecutor);
      return;
    }
    finally {}
  }
  
  public void execute()
  {
    Object localObject4;
    try
    {
      if (executed) {
        return;
      }
      executed = true;
      Object localObject3 = runnables;
      runnables = null;
      Object localObject1 = null;
      for (;;)
      {
        localObject4 = localObject1;
        if (localObject3 == null) {
          break;
        }
        localObject4 = next;
        next = ((RunnableExecutorPair)localObject1);
        localObject1 = localObject3;
        localObject3 = localObject4;
      }
      if (localObject4 == null) {
        return;
      }
    }
    finally {}
    for (;;)
    {
      executeListener(runnable, executor);
      localObject4 = next;
    }
  }
  
  private static final class RunnableExecutorPair
  {
    final Executor executor;
    @Nullable
    RunnableExecutorPair next;
    final Runnable runnable;
    
    RunnableExecutorPair(Runnable paramRunnable, Executor paramExecutor, RunnableExecutorPair paramRunnableExecutorPair)
    {
      runnable = paramRunnable;
      executor = paramExecutor;
      next = paramRunnableExecutorPair;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ExecutionList
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */