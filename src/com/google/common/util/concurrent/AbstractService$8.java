package com.google.common.util.concurrent;

class AbstractService$8
  extends Monitor.Guard
{
  AbstractService$8(AbstractService paramAbstractService, Monitor paramMonitor)
  {
    super(paramMonitor);
  }
  
  public boolean isSatisfied()
  {
    return this$0.state().isTerminal();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.8
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */