package com.google.common.util.concurrent;

class ServiceManager$ServiceManagerState$5
  extends ListenerCallQueue.Callback<ServiceManager.Listener>
{
  ServiceManager$ServiceManagerState$5(ServiceManager.ServiceManagerState paramServiceManagerState, String paramString, Service paramService)
  {
    super(paramString);
  }
  
  void call(ServiceManager.Listener paramListener)
  {
    paramListener.failure(val$service);
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.ServiceManagerState.5
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */