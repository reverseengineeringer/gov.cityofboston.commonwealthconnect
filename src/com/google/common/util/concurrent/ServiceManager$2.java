package com.google.common.util.concurrent;

final class ServiceManager$2
  extends ListenerCallQueue.Callback<ServiceManager.Listener>
{
  ServiceManager$2(String paramString)
  {
    super(paramString);
  }
  
  void call(ServiceManager.Listener paramListener)
  {
    paramListener.stopped();
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */