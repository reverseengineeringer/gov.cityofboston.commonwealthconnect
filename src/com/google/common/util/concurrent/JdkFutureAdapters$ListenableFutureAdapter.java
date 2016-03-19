package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicBoolean;

class JdkFutureAdapters$ListenableFutureAdapter<V>
  extends ForwardingFuture<V>
  implements ListenableFuture<V>
{
  private static final Executor defaultAdapterExecutor = Executors.newCachedThreadPool(threadFactory);
  private static final ThreadFactory threadFactory = new ThreadFactoryBuilder().setDaemon(true).setNameFormat("ListenableFutureAdapter-thread-%d").build();
  private final Executor adapterExecutor;
  private final Future<V> delegate;
  private final ExecutionList executionList = new ExecutionList();
  private final AtomicBoolean hasListeners = new AtomicBoolean(false);
  
  JdkFutureAdapters$ListenableFutureAdapter(Future<V> paramFuture)
  {
    this(paramFuture, defaultAdapterExecutor);
  }
  
  JdkFutureAdapters$ListenableFutureAdapter(Future<V> paramFuture, Executor paramExecutor)
  {
    delegate = ((Future)Preconditions.checkNotNull(paramFuture));
    adapterExecutor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }
  
  public void addListener(Runnable paramRunnable, Executor paramExecutor)
  {
    executionList.add(paramRunnable, paramExecutor);
    if (hasListeners.compareAndSet(false, true))
    {
      if (delegate.isDone()) {
        executionList.execute();
      }
    }
    else {
      return;
    }
    adapterExecutor.execute(new Runnable()
    {
      public void run()
      {
        try
        {
          Uninterruptibles.getUninterruptibly(delegate);
          executionList.execute();
          return;
        }
        catch (Error localError)
        {
          throw localError;
        }
        catch (Throwable localThrowable)
        {
          for (;;) {}
        }
      }
    });
  }
  
  protected Future<V> delegate()
  {
    return delegate;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.JdkFutureAdapters.ListenableFutureAdapter
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */