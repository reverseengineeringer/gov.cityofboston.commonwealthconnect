package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;

@Beta
public class AsyncEventBus
  extends EventBus
{
  private final ConcurrentLinkedQueue<EventBus.EventWithSubscriber> eventsToDispatch = new ConcurrentLinkedQueue();
  private final Executor executor;
  
  public AsyncEventBus(String paramString, Executor paramExecutor)
  {
    super(paramString);
    executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }
  
  public AsyncEventBus(Executor paramExecutor)
  {
    super("default");
    executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }
  
  public AsyncEventBus(Executor paramExecutor, SubscriberExceptionHandler paramSubscriberExceptionHandler)
  {
    super(paramSubscriberExceptionHandler);
    executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }
  
  void dispatch(final Object paramObject, final EventSubscriber paramEventSubscriber)
  {
    Preconditions.checkNotNull(paramObject);
    Preconditions.checkNotNull(paramEventSubscriber);
    executor.execute(new Runnable()
    {
      public void run()
      {
        AsyncEventBus.this.dispatch(paramObject, paramEventSubscriber);
      }
    });
  }
  
  protected void dispatchQueuedEvents()
  {
    for (;;)
    {
      EventBus.EventWithSubscriber localEventWithSubscriber = (EventBus.EventWithSubscriber)eventsToDispatch.poll();
      if (localEventWithSubscriber == null) {
        return;
      }
      dispatch(event, subscriber);
    }
  }
  
  void enqueueEvent(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    eventsToDispatch.offer(new EventBus.EventWithSubscriber(paramObject, paramEventSubscriber));
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.AsyncEventBus
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */