package com.google.common.util.concurrent;

class Futures$FallbackFuture$1
  implements FutureCallback<V>
{
  Futures$FallbackFuture$1(Futures.FallbackFuture paramFallbackFuture, FutureFallback paramFutureFallback) {}
  
  public void onFailure(Throwable paramThrowable)
  {
    if (this$0.isCancelled()) {
      return;
    }
    try
    {
      Futures.FallbackFuture.access$102(this$0, val$fallback.create(paramThrowable));
      if (this$0.isCancelled())
      {
        Futures.FallbackFuture.access$100(this$0).cancel(this$0.wasInterrupted());
        return;
      }
    }
    catch (Throwable paramThrowable)
    {
      this$0.setException(paramThrowable);
      return;
    }
    Futures.addCallback(Futures.FallbackFuture.access$100(this$0), new FutureCallback()
    {
      public void onFailure(Throwable paramAnonymousThrowable)
      {
        if (Futures.FallbackFuture.access$100(this$0).isCancelled())
        {
          this$0.cancel(false);
          return;
        }
        this$0.setException(paramAnonymousThrowable);
      }
      
      public void onSuccess(V paramAnonymousV)
      {
        this$0.set(paramAnonymousV);
      }
    }, MoreExecutors.sameThreadExecutor());
  }
  
  public void onSuccess(V paramV)
  {
    this$0.set(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.FallbackFuture.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */