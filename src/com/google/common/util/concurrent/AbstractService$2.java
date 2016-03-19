package com.google.common.util.concurrent;

final class AbstractService$2
  extends ListenerCallQueue.Callback<Service.Listener>
{
  AbstractService$2(String paramString)
  {
    super(paramString);
  }
  
  void call(Service.Listener paramListener)
  {
    paramListener.running();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */