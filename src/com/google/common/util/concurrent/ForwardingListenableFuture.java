package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.concurrent.Executor;

public abstract class ForwardingListenableFuture<V>
  extends ForwardingFuture<V>
  implements ListenableFuture<V>
{
  public void addListener(Runnable paramRunnable, Executor paramExecutor)
  {
    delegate().addListener(paramRunnable, paramExecutor);
  }
  
  protected abstract ListenableFuture<V> delegate();
  
  public static abstract class SimpleForwardingListenableFuture<V>
    extends ForwardingListenableFuture<V>
  {
    private final ListenableFuture<V> delegate;
    
    protected SimpleForwardingListenableFuture(ListenableFuture<V> paramListenableFuture)
    {
      delegate = ((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
    }
    
    protected final ListenableFuture<V> delegate()
    {
      return delegate;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ForwardingListenableFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */