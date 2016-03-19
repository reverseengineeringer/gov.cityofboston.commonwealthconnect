package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableList.Builder;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

abstract class WrappingExecutorService
  implements ExecutorService
{
  private final ExecutorService delegate;
  
  protected WrappingExecutorService(ExecutorService paramExecutorService)
  {
    delegate = ((ExecutorService)Preconditions.checkNotNull(paramExecutorService));
  }
  
  private final <T> ImmutableList<Callable<T>> wrapTasks(Collection<? extends Callable<T>> paramCollection)
  {
    ImmutableList.Builder localBuilder = ImmutableList.builder();
    paramCollection = paramCollection.iterator();
    while (paramCollection.hasNext()) {
      localBuilder.add(wrapTask((Callable)paramCollection.next()));
    }
    return localBuilder.build();
  }
  
  public final boolean awaitTermination(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return delegate.awaitTermination(paramLong, paramTimeUnit);
  }
  
  public final void execute(Runnable paramRunnable)
  {
    delegate.execute(wrapTask(paramRunnable));
  }
  
  public final <T> List<Future<T>> invokeAll(Collection<? extends Callable<T>> paramCollection)
    throws InterruptedException
  {
    return delegate.invokeAll(wrapTasks(paramCollection));
  }
  
  public final <T> List<Future<T>> invokeAll(Collection<? extends Callable<T>> paramCollection, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return delegate.invokeAll(wrapTasks(paramCollection), paramLong, paramTimeUnit);
  }
  
  public final <T> T invokeAny(Collection<? extends Callable<T>> paramCollection)
    throws InterruptedException, ExecutionException
  {
    return (T)delegate.invokeAny(wrapTasks(paramCollection));
  }
  
  public final <T> T invokeAny(Collection<? extends Callable<T>> paramCollection, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, TimeoutException
  {
    return (T)delegate.invokeAny(wrapTasks(paramCollection), paramLong, paramTimeUnit);
  }
  
  public final boolean isShutdown()
  {
    return delegate.isShutdown();
  }
  
  public final boolean isTerminated()
  {
    return delegate.isTerminated();
  }
  
  public final void shutdown()
  {
    delegate.shutdown();
  }
  
  public final List<Runnable> shutdownNow()
  {
    return delegate.shutdownNow();
  }
  
  public final Future<?> submit(Runnable paramRunnable)
  {
    return delegate.submit(wrapTask(paramRunnable));
  }
  
  public final <T> Future<T> submit(Runnable paramRunnable, T paramT)
  {
    return delegate.submit(wrapTask(paramRunnable), paramT);
  }
  
  public final <T> Future<T> submit(Callable<T> paramCallable)
  {
    return delegate.submit(wrapTask((Callable)Preconditions.checkNotNull(paramCallable)));
  }
  
  protected Runnable wrapTask(Runnable paramRunnable)
  {
    new Runnable()
    {
      public void run()
      {
        try
        {
          val$wrapped.call();
          return;
        }
        catch (Exception localException)
        {
          Throwables.propagate(localException);
        }
      }
    };
  }
  
  protected abstract <T> Callable<T> wrapTask(Callable<T> paramCallable);
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.WrappingExecutorService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */