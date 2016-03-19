package com.google.common.util.concurrent;

import java.util.concurrent.ThreadFactory;

class AbstractScheduledService$2
  implements ThreadFactory
{
  AbstractScheduledService$2(AbstractScheduledService paramAbstractScheduledService) {}
  
  public Thread newThread(Runnable paramRunnable)
  {
    return MoreExecutors.newThread(this$0.serviceName(), paramRunnable);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractScheduledService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */