package com.google.common.util.concurrent;

import java.util.concurrent.ExecutionException;

final class Futures$5
  implements Runnable
{
  Futures$5(ListenableFuture paramListenableFuture, FutureCallback paramFutureCallback) {}
  
  public void run()
  {
    try
    {
      Object localObject = Uninterruptibles.getUninterruptibly(val$future);
      val$callback.onSuccess(localObject);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      val$callback.onFailure(localExecutionException.getCause());
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      val$callback.onFailure(localRuntimeException);
      return;
    }
    catch (Error localError)
    {
      val$callback.onFailure(localError);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */