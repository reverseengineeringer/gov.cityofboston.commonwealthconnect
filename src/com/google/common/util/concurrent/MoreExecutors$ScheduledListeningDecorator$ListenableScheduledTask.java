package com.google.common.util.concurrent;

import java.util.concurrent.Delayed;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

final class MoreExecutors$ScheduledListeningDecorator$ListenableScheduledTask<V>
  extends ForwardingListenableFuture.SimpleForwardingListenableFuture<V>
  implements ListenableScheduledFuture<V>
{
  private final ScheduledFuture<?> scheduledDelegate;
  
  public MoreExecutors$ScheduledListeningDecorator$ListenableScheduledTask(ListenableFuture<V> paramListenableFuture, ScheduledFuture<?> paramScheduledFuture)
  {
    super(paramListenableFuture);
    scheduledDelegate = paramScheduledFuture;
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    boolean bool = super.cancel(paramBoolean);
    if (bool) {
      scheduledDelegate.cancel(paramBoolean);
    }
    return bool;
  }
  
  public int compareTo(Delayed paramDelayed)
  {
    return scheduledDelegate.compareTo(paramDelayed);
  }
  
  public long getDelay(TimeUnit paramTimeUnit)
  {
    return scheduledDelegate.getDelay(paramTimeUnit);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.ScheduledListeningDecorator.ListenableScheduledTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */