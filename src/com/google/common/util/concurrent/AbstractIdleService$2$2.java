package com.google.common.util.concurrent;

import com.google.common.base.Throwables;

class AbstractIdleService$2$2
  implements Runnable
{
  AbstractIdleService$2$2(AbstractIdleService.2 param2) {}
  
  public void run()
  {
    try
    {
      this$1.this$0.shutDown();
      this$1.notifyStopped();
      return;
    }
    catch (Throwable localThrowable)
    {
      this$1.notifyFailed(localThrowable);
      throw Throwables.propagate(localThrowable);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractIdleService.2.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */