package com.google.common.util.concurrent;

class Futures$NonCancellationPropagatingFuture$1
  implements FutureCallback<V>
{
  Futures$NonCancellationPropagatingFuture$1(Futures.NonCancellationPropagatingFuture paramNonCancellationPropagatingFuture, ListenableFuture paramListenableFuture) {}
  
  public void onFailure(Throwable paramThrowable)
  {
    if (val$delegate.isCancelled())
    {
      this$0.cancel(false);
      return;
    }
    this$0.setException(paramThrowable);
  }
  
  public void onSuccess(V paramV)
  {
    this$0.set(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.NonCancellationPropagatingFuture.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */