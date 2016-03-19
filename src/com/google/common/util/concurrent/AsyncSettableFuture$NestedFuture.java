package com.google.common.util.concurrent;

final class AsyncSettableFuture$NestedFuture<V>
  extends AbstractFuture<ListenableFuture<? extends V>>
{
  boolean setFuture(ListenableFuture<? extends V> paramListenableFuture)
  {
    boolean bool = set(paramListenableFuture);
    if (isCancelled()) {
      paramListenableFuture.cancel(wasInterrupted());
    }
    return bool;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AsyncSettableFuture.NestedFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */