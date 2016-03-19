package com.google.common.util.concurrent;

import com.google.common.annotations.Beta;

@Beta
public abstract class Service$Listener
{
  public void failed(Service.State paramState, Throwable paramThrowable) {}
  
  public void running() {}
  
  public void starting() {}
  
  public void stopping(Service.State paramState) {}
  
  public void terminated(Service.State paramState) {}
}

/* Location:
 * Qualified Name:     com.google.common.util.concurrent.Service.Listener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */