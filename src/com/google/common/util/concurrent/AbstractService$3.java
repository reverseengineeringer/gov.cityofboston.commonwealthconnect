package com.google.common.util.concurrent;

final class AbstractService$3
  extends ListenerCallQueue.Callback<Service.Listener>
{
  AbstractService$3(String paramString, Service.State paramState)
  {
    super(paramString);
  }
  
  void call(Service.Listener paramListener)
  {
    paramListener.terminated(val$from);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.3
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */