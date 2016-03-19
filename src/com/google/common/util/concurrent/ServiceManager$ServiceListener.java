package com.google.common.util.concurrent;

import java.lang.ref.WeakReference;
import java.util.logging.Level;
import java.util.logging.Logger;

final class ServiceManager$ServiceListener
  extends Service.Listener
{
  final Service service;
  final WeakReference<ServiceManager.ServiceManagerState> state;
  
  ServiceManager$ServiceListener(Service paramService, WeakReference<ServiceManager.ServiceManagerState> paramWeakReference)
  {
    service = paramService;
    state = paramWeakReference;
  }
  
  public void failed(Service.State paramState, Throwable paramThrowable)
  {
    ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
    if (localServiceManagerState != null)
    {
      if (!(service instanceof ServiceManager.NoOpService)) {
        ServiceManager.access$200().log(Level.SEVERE, "Service " + service + " has failed in the " + paramState + " state.", paramThrowable);
      }
      localServiceManagerState.transitionService(service, paramState, Service.State.FAILED);
    }
  }
  
  public void running()
  {
    ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
    if (localServiceManagerState != null) {
      localServiceManagerState.transitionService(service, Service.State.STARTING, Service.State.RUNNING);
    }
  }
  
  public void starting()
  {
    ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
    if (localServiceManagerState != null)
    {
      localServiceManagerState.transitionService(service, Service.State.NEW, Service.State.STARTING);
      if (!(service instanceof ServiceManager.NoOpService)) {
        ServiceManager.access$200().log(Level.FINE, "Starting {0}.", service);
      }
    }
  }
  
  public void stopping(Service.State paramState)
  {
    ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
    if (localServiceManagerState != null) {
      localServiceManagerState.transitionService(service, paramState, Service.State.STOPPING);
    }
  }
  
  public void terminated(Service.State paramState)
  {
    ServiceManager.ServiceManagerState localServiceManagerState = (ServiceManager.ServiceManagerState)state.get();
    if (localServiceManagerState != null)
    {
      if (!(service instanceof ServiceManager.NoOpService)) {
        ServiceManager.access$200().log(Level.FINE, "Service {0} has terminated. Previous state was: {1}", new Object[] { service, paramState });
      }
      localServiceManagerState.transitionService(service, paramState, Service.State.TERMINATED);
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.ServiceManager.ServiceListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */