package com.google.common.cache;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.logging.Level;
import java.util.logging.Logger;

class LocalCache$Segment$1
  implements Runnable
{
  LocalCache$Segment$1(LocalCache.Segment paramSegment, Object paramObject, int paramInt, LocalCache.LoadingValueReference paramLoadingValueReference, ListenableFuture paramListenableFuture) {}
  
  public void run()
  {
    try
    {
      this$0.getAndRecordStats(val$key, val$hash, val$loadingValueReference, val$loadingFuture);
      return;
    }
    catch (Throwable localThrowable)
    {
      LocalCache.logger.log(Level.WARNING, "Exception thrown during refresh", localThrowable);
      val$loadingValueReference.setException(localThrowable);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.Segment.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */