package com.google.common.util.concurrent;

class Futures$FallbackFuture$1$1
  implements FutureCallback<V>
{
  Futures$FallbackFuture$1$1(Futures.FallbackFuture.1 param1) {}
  
  public void onFailure(Throwable paramThrowable)
  {
    if (Futures.FallbackFuture.access$100(this$1.this$0).isCancelled())
    {
      this$1.this$0.cancel(false);
      return;
    }
    this$1.this$0.setException(paramThrowable);
  }
  
  public void onSuccess(V paramV)
  {
    this$1.this$0.set(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.FallbackFuture.1.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */