package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;
import java.util.concurrent.AbstractExecutorService;
import java.util.concurrent.Callable;
import javax.annotation.Nullable;

@Beta
public abstract class AbstractListeningExecutorService
  extends AbstractExecutorService
  implements ListeningExecutorService
{
  protected final <T> ListenableFutureTask<T> newTaskFor(Runnable paramRunnable, T paramT)
  {
    return ListenableFutureTask.create(paramRunnable, paramT);
  }
  
  protected final <T> ListenableFutureTask<T> newTaskFor(Callable<T> paramCallable)
  {
    return ListenableFutureTask.create(paramCallable);
  }
  
  public ListenableFuture<?> submit(Runnable paramRunnable)
  {
    return (ListenableFuture)super.submit(paramRunnable);
  }
  
  public <T> ListenableFuture<T> submit(Runnable paramRunnable, @Nullable T paramT)
  {
    return (ListenableFuture)super.submit(paramRunnable, paramT);
  }
  
  public <T> ListenableFuture<T> submit(Callable<T> paramCallable)
  {
    return (ListenableFuture)super.submit(paramCallable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractListeningExecutorService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */