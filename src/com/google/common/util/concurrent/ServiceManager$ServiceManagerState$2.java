package com.google.common.util.concurrent;

import com.google.common.collect.Multiset;

class ServiceManager$ServiceManagerState$2
  extends Monitor.Guard
{
  ServiceManager$ServiceManagerState$2(ServiceManager.ServiceManagerState paramServiceManagerState, Monitor paramMonitor)
  {
    super(paramMonitor);
  }
  
  public boolean isSatisfied()
  {
    return (this$0.states.count(Service.State.RUNNING) == this$0.numberOfServices) || (this$0.states.contains(Service.State.STOPPING)) || (this$0.states.contains(Service.State.TERMINATED)) || (this$0.states.contains(Service.State.FAILED));
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.ServiceManagerState.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */