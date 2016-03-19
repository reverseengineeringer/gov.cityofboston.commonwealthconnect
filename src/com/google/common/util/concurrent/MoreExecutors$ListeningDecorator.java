package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

class MoreExecutors$ListeningDecorator
  extends AbstractListeningExecutorService
{
  private final ExecutorService delegate;
  
  MoreExecutors$ListeningDecorator(ExecutorService paramExecutorService)
  {
    delegate = ((ExecutorService)Preconditions.checkNotNull(paramExecutorService));
  }
  
  public boolean awaitTermination(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    return delegate.awaitTermination(paramLong, paramTimeUnit);
  }
  
  public void execute(Runnable paramRunnable)
  {
    delegate.execute(paramRunnable);
  }
  
  public boolean isShutdown()
  {
    return delegate.isShutdown();
  }
  
  public boolean isTerminated()
  {
    return delegate.isTerminated();
  }
  
  public void shutdown()
  {
    delegate.shutdown();
  }
  
  public List<Runnable> shutdownNow()
  {
    return delegate.shutdownNow();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.ListeningDecorator
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */