package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.util.logging.Level;
import java.util.logging.Logger;

final class EventBus$LoggingSubscriberExceptionHandler
  implements SubscriberExceptionHandler
{
  private final Logger logger;
  
  public EventBus$LoggingSubscriberExceptionHandler(String paramString)
  {
    logger = Logger.getLogger(EventBus.class.getName() + "." + (String)Preconditions.checkNotNull(paramString));
  }
  
  public void handleException(Throwable paramThrowable, SubscriberExceptionContext paramSubscriberExceptionContext)
  {
    logger.log(Level.SEVERE, "Could not dispatch event: " + paramSubscriberExceptionContext.getSubscriber() + " to " + paramSubscriberExceptionContext.getSubscriberMethod(), paramThrowable.getCause());
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.EventBus.LoggingSubscriberExceptionHandler
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */