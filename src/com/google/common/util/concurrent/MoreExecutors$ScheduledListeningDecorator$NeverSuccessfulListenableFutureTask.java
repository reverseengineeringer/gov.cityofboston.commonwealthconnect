package com.google.common.util.concurrent;

import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;

final class MoreExecutors$ScheduledListeningDecorator$NeverSuccessfulListenableFutureTask
  extends AbstractFuture<Void>
  implements Runnable
{
  private final Runnable delegate;
  
  public MoreExecutors$ScheduledListeningDecorator$NeverSuccessfulListenableFutureTask(Runnable paramRunnable)
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

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.MoreExecutors.ScheduledListeningDecorator.NeverSuccessfulListenableFutureTask
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */