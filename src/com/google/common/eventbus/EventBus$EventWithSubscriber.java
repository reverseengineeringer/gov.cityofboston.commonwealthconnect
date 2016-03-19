package com.google.common.eventbus;

import com.google.common.base.Preconditions;

class EventBus$EventWithSubscriber
{
  final Object event;
  final EventSubscriber subscriber;
  
  public EventBus$EventWithSubscriber(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    event = Preconditions.checkNotNull(paramObject);
    subscriber = ((EventSubscriber)Preconditions.checkNotNull(paramEventSubscriber));
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.EventBus.EventWithSubscriber
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */