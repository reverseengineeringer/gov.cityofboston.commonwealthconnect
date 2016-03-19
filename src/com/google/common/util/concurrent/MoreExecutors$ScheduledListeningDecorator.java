package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import java.util.concurrent.Callable;
import java.util.concurrent.Delayed;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;

class MoreExecutors$ScheduledListeningDecorator
  extends MoreExecutors.ListeningDecorator
  implements ListeningScheduledExecutorService
{
  final ScheduledExecutorService delegate;
  
  MoreExecutors$ScheduledListeningDecorator(ScheduledExecutorService paramScheduledExecutorService)
  {
    super(paramScheduledExecutorService);
    delegate = ((ScheduledExecutorService)Preconditions.checkNotNull(paramScheduledExecutorService));
  }
  
  public ListenableScheduledFuture<?> schedule(Runnable paramRunnable, long paramLong, TimeUnit paramTimeUnit)
  {
    paramRunnable = ListenableFutureTask.create(paramRunnable, null);
    return new ListenableScheduledTask(paramRunnable, delegate.schedule(paramRunnable, paramLong, paramTimeUnit));
  }
  
  public <V> ListenableScheduledFuture<V> schedule(Callable<V> paramCallable, long paramLong, TimeUnit paramTimeUnit)
  {
    paramCallable = ListenableFutureTask.create(paramCallable);
    return new ListenableScheduledTask(paramCallable, delegate.schedule(paramCallable, paramLong, paramTimeUnit));
  }
  
  public ListenableScheduledFuture<?> scheduleAtFixedRate(Runnable paramRunnable, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
  {
    paramRunnable = new NeverSuccessfulListenableFutureTask(paramRunnable);
    return new ListenableScheduledTask(paramRunnable, delegate.scheduleAtFixedRate(paramRunnable, paramLong1, paramLong2, paramTimeUnit));
  }
  
  public ListenableScheduledFuture<?> scheduleWithFixedDelay(Runnable paramRunnable, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
  {
    paramRunnable = new NeverSuccessfulListenableFutureTask(paramRunnable);
    return new ListenableScheduledTask(paramRunnable, delegate.scheduleWithFixedDelay(paramRunnable, paramLong1, paramLong2, paramTimeUnit));
  }
  
  private static final class ListenableScheduledTask<V>
    extends ForwardingListenableFuture.SimpleForwardingListenableFuture<V>
    implements ListenableScheduledFuture<V>
  {
    private final ScheduledFuture<?> scheduledDelegate;
    
    public ListenableScheduledTask(ListenableFuture<V> paramListenableFuture, ScheduledFuture<?> paramScheduledFuture)
    {
      super();
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
  
  private static final class NeverSuccessfulListenableFutureTask
    extends AbstractFuture<Void>
    implements Runnable
  {
    private final Runnable delegate;
    
    public NeverSuccessfulListenableFutureTask(Runnable paramRunnable)
    {
      delegate = ((Runnable)Preconditions.checkNotNull(paramRunnable));
    }
    
    public void run()
    {
      try
      {
        delegate.run();
        return;
      }
      catch (Throwable localThrowable)
      {
        setException(localThrowable);
        throw Throwables.propagate(localThrowable);
      }
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.ScheduledListeningDecorator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */