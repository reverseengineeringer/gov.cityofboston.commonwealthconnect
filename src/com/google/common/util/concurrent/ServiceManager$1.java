package com.google.common.util.concurrent;

final class ServiceManager$1
  extends ListenerCallQueue.Callback<ServiceManager.Listener>
{
  ServiceManager$1(String paramString)
  {
    super(paramString);
  }
  
  void call(ServiceManager.Listener paramListener)
  {
    paramListener.healthy();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */