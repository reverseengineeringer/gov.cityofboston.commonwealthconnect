package com.google.common.util.concurrent;

import java.util.concurrent.Executor;

class Futures$FallbackFuture<V>
  extends AbstractFuture<V>
{
  private volatile ListenableFuture<? extends V> running;
  
  Futures$FallbackFuture(ListenableFuture<? extends V> paramListenableFuture, final FutureFallback<? extends V> paramFutureFallback, Executor paramExecutor)
  {
    running = paramListenableFuture;
    Futures.addCallback(running, new FutureCallback()
    {
      public void onFailure(Throwable paramAnonymousThrowable)
      {
        if (isCancelled()) {
          return;
        }
        try
        {
          Futures.FallbackFuture.access$102(Futures.FallbackFuture.this, paramFutureFallback.create(paramAnonymousThrowable));
          if (isCancelled())
          {
            running.cancel(wasInterrupted());
            return;
          }
        }
        catch (Throwable paramAnonymousThrowable)
        {
          setException(paramAnonymousThrowable);
          return;
        }
        Futures.addCallback(running, new FutureCallback()
        {
          public void onFailure(Throwable paramAnonymous2Throwable)
          {
            if (running.isCancelled())
            {
              cancel(false);
              return;
            }
            setException(paramAnonymous2Throwable);
          }
          
          public void onSuccess(V paramAnonymous2V)
          {
            set(paramAnonymous2V);
          }
        }, MoreExecutors.sameThreadExecutor());
      }
      
      public void onSuccess(V paramAnonymousV)
      {
        set(paramAnonymousV);
      }
    }, paramExecutor);
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    if (super.cancel(paramBoolean))
    {
      running.cancel(paramBoolean);
      return true;
    }
    return false;
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.FallbackFuture
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */