package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;

@Beta
public class DeadEvent
{
  private final Object event;
  private final Object source;
  
  public DeadEvent(Object paramObject1, Object paramObject2)
  {
    source = Preconditions.checkNotNull(paramObject1);
    event = Preconditions.checkNotNull(paramObject2);
  }
  
  public Object getEvent()
  {
    return event;
  }
  
  public Object getSource()
  {
    return source;
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.DeadEvent
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */