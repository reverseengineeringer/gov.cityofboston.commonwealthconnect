package com.google.common.util.concurrent;

import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;

class Futures$ChainingListenableFuture$1
  implements Runnable
{
  Futures$ChainingListenableFuture$1(Futures.ChainingListenableFuture paramChainingListenableFuture, ListenableFuture paramListenableFuture) {}
  
  public void run()
  {
    try
    {
      this$0.set(Uninterruptibles.getUninterruptibly(val$outputFuture));
      return;
    }
    catch (CancellationException localCancellationException)
    {
      this$0.cancel(false);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      this$0.setException(localExecutionException.getCause());
      return;
    }
    finally
    {
      Futures.ChainingListenableFuture.access$302(this$0, null);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Futures.ChainingListenableFuture.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */