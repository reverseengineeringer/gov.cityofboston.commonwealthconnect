package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;

public abstract class ForwardingListenableFuture$SimpleForwardingListenableFuture<V>
  extends ForwardingListenableFuture<V>
{
  private final ListenableFuture<V> delegate;
  
  protected ForwardingListenableFuture$SimpleForwardingListenableFuture(ListenableFuture<V> paramListenableFuture)
  {
    delegate = ((ListenableFuture)Preconditions.checkNotNull(paramListenableFuture));
  }
  
  protected final ListenableFuture<V> delegate()
  {
    return delegate;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ForwardingListenableFuture.SimpleForwardingListenableFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */