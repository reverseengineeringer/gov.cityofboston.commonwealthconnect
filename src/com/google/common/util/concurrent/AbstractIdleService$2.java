package com.google.common.util.concurrent;

import com.google.common.base.Throwables;
import java.util.concurrent.Executor;

class AbstractIdleService$2
  extends AbstractService
{
  AbstractIdleService$2(AbstractIdleService paramAbstractIdleService) {}
  
  protected final void doStart()
  {
    MoreExecutors.renamingDecorator(this$0.executor(), AbstractIdleService.access$000(this$0)).execute(new Runnable()
    {
      public void run()
      {
        try
        {
          this$0.startUp();
          notifyStarted();
          return;
        }
        catch (Throwable localThrowable)
        {
          notifyFailed(localThrowable);
          throw Throwables.propagate(localThrowable);
        }
      }
    });
  }
  
  protected final void doStop()
  {
    MoreExecutors.renamingDecorator(this$0.executor(), AbstractIdleService.access$000(this$0)).execute(new Runnable()
    {
      public void run()
      {
        try
        {
          this$0.shutDown();
          notifyStopped();
          return;
        }
        catch (Throwable localThrowable)
        {
          notifyFailed(localThrowable);
          throw Throwables.propagate(localThrowable);
        }
      }
    });
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractIdleService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */