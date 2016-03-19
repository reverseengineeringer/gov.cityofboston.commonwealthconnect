package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.Method;

public class SubscriberExceptionContext
{
  private final Object event;
  private final EventBus eventBus;
  private final Object subscriber;
  private final Method subscriberMethod;
  
  SubscriberExceptionContext(EventBus paramEventBus, Object paramObject1, Object paramObject2, Method paramMethod)
  {
    eventBus = ((EventBus)Preconditions.checkNotNull(paramEventBus));
    event = Preconditions.checkNotNull(paramObject1);
    subscriber = Preconditions.checkNotNull(paramObject2);
    subscriberMethod = ((Method)Preconditions.checkNotNull(paramMethod));
  }
  
  public Object getEvent()
  {
    return event;
  }
  
  public EventBus getEventBus()
  {
    return eventBus;
  }
  
  public Object getSubscriber()
  {
    return subscriber;
  }
  
  public Method getSubscriberMethod()
  {
    return subscriberMethod;
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.SubscriberExceptionContext
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */