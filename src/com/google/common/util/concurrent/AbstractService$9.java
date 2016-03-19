package com.google.common.util.concurrent;

class AbstractService$9
  extends ListenerCallQueue.Callback<Service.Listener>
{
  AbstractService$9(AbstractService paramAbstractService, String paramString, Service.State paramState, Throwable paramThrowable)
  {
    super(paramString);
  }
  
  void call(Service.Listener paramListener)
  {
    paramListener.failed(val$from, val$cause);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.AbstractService.9
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */