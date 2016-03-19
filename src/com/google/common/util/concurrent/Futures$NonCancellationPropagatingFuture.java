package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;

class Futures$NonCancellationPropagatingFuture<V>
  extends AbstractFuture<V>
{
  Futures$NonCancellationPropagatingFuture(final ListenableFuture<V> paramListenableFuture)
  {
    Preconditions.checkNotNull(paramListenableFuture);
    Futures.addCallback(paramListenableFuture, new FutureCallback()
    {
      public void onFailure(Throwable paramAnonymousThrowable)
      {
        if (paramListenableFuture.isCancelled())
        {
          cancel(false);
          return;
        }
        setException(paramAnonymousThrowable);
      }
      
      public void onSuccess(V paramAnonymousV)
      {
        set(paramAnonymousV);
      }
    }, MoreExecutors.sameThreadExecutor());
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.NonCancellationPropagatingFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */