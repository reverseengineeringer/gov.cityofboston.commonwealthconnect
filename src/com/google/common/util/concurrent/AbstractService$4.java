package com.google.common.util.concurrent;

final class AbstractService$4
  extends ListenerCallQueue.Callback<Service.Listener>
{
  AbstractService$4(String paramString, Service.State paramState)
  {
    super(paramString);
  }
  
  void call(Service.Listener paramListener)
  {
    paramListener.stopping(val$from);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.4
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */