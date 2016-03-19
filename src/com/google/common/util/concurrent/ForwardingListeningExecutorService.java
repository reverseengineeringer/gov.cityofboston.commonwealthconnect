package com.google.common.util.concurrent;

import java.util.concurrent.Callable;

public abstract class ForwardingListeningExecutorService
  extends ForwardingExecutorService
  implements ListeningExecutorService
{
  protected abstract ListeningExecutorService delegate();
  
  public ListenableFuture<?> submit(Runnable paramRunnable)
  {
    return delegate().submit(paramRunnable);
  }
  
  public <T> ListenableFuture<T> submit(Runnable paramRunnable, T paramT)
  {
    return delegate().submit(paramRunnable, paramT);
  }
  
  public <T> ListenableFuture<T> submit(Callable<T> paramCallable)
  {
    return delegate().submit(paramCallable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ForwardingListeningExecutorService
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */