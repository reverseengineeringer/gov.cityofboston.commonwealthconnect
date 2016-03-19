package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

abstract class Futures$ImmediateFuture<V>
  implements ListenableFuture<V>
{
  private static final Logger log = Logger.getLogger(ImmediateFuture.class.getName());
  
  public void addListener(Runnable paramRunnable, Executor paramExecutor)
  {
    Preconditions.checkNotNull(paramRunnable, "Runnable was null.");
    Preconditions.checkNotNull(paramExecutor, "Executor was null.");
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
  
  public boolean cancel(boolean paramBoolean)
  {
    return false;
  }
  
  public abstract V get()
    throws ExecutionException;
  
  public V get(long paramLong, TimeUnit paramTimeUnit)
    throws ExecutionException
  {
    Preconditions.checkNotNull(paramTimeUnit);
    return (V)get();
  }
  
  public boolean isCancelled()
  {
    return false;
  }
  
  public boolean isDone()
  {
    return true;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ImmediateFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */