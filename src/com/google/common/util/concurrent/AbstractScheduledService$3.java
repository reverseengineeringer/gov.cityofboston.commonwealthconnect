package com.google.common.util.concurrent;

import java.util.concurrent.ScheduledExecutorService;

class AbstractScheduledService$3
  extends Service.Listener
{
  AbstractScheduledService$3(AbstractScheduledService paramAbstractScheduledService, ScheduledExecutorService paramScheduledExecutorService) {}
  
  public void failed(Service.State paramState, Throwable paramThrowable)
  {
    val$executor.shutdown();
  }
  
  public void terminated(Service.State paramState)
  {
    val$executor.shutdown();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */