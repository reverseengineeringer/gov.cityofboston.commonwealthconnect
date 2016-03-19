package com.google.common.eventbus;

import com.google.common.collect.Multimap;

abstract interface SubscriberFindingStrategy
{
  public abstract Multimap<Class<?>, EventSubscriber> findAllSubscribers(Object paramObject);
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.SubscriberFindingStrategy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */