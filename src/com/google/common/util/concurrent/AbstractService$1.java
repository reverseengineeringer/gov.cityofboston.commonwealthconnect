package com.google.common.util.concurrent;

final class AbstractService$1
  extends ListenerCallQueue.Callback<Service.Listener>
{
  AbstractService$1(String paramString)
  {
    super(paramString);
  }
  
  void call(Service.Listener paramListener)
  {
    paramListener.starting();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */