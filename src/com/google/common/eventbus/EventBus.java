package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Throwables;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import com.google.common.collect.SetMultimap;
import com.google.common.reflect.TypeToken;
import com.google.common.reflect.TypeToken.TypeSet;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Queue;
import java.util.Set;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReadWriteLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;
import java.util.logging.Level;
import java.util.logging.Logger;

@Beta
public class EventBus
{
  private static final LoadingCache<Class<?>, Set<Class<?>>> flattenHierarchyCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader()
  {
    public Set<Class<?>> load(Class<?> paramAnonymousClass)
    {
      return TypeToken.of(paramAnonymousClass).getTypes().rawTypes();
    }
  });
  private final ThreadLocal<Queue<EventWithSubscriber>> eventsToDispatch = new ThreadLocal()
  {
    protected Queue<EventBus.EventWithSubscriber> initialValue()
    {
      return new LinkedList();
    }
  };
  private final SubscriberFindingStrategy finder = new AnnotatedSubscriberFinder();
  private final ThreadLocal<Boolean> isDispatching = new ThreadLocal()
  {
    protected Boolean initialValue()
    {
      return Boolean.valueOf(false);
    }
  };
  private SubscriberExceptionHandler subscriberExceptionHandler;
  private final SetMultimap<Class<?>, EventSubscriber> subscribersByType = HashMultimap.create();
  private final ReadWriteLock subscribersByTypeLock = new ReentrantReadWriteLock();
  
  public EventBus()
  {
    this("default");
  }
  
  public EventBus(SubscriberExceptionHandler paramSubscriberExceptionHandler)
  {
    subscriberExceptionHandler = ((SubscriberExceptionHandler)Preconditions.checkNotNull(paramSubscriberExceptionHandler));
  }
  
  public EventBus(String paramString)
  {
    this(new LoggingSubscriberExceptionHandler(paramString));
  }
  
  void dispatch(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    try
    {
      paramEventSubscriber.handleEvent(paramObject);
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      try
      {
        subscriberExceptionHandler.handleException(localInvocationTargetException.getCause(), new SubscriberExceptionContext(this, paramObject, paramEventSubscriber.getSubscriber(), paramEventSubscriber.getMethod()));
        return;
      }
      catch (Throwable paramObject)
      {
        Logger.getLogger(EventBus.class.getName()).log(Level.SEVERE, String.format("Exception %s thrown while handling exception: %s", new Object[] { paramObject, localInvocationTargetException.getCause() }), (Throwable)paramObject);
      }
    }
  }
  
  void dispatchQueuedEvents()
  {
    if (((Boolean)isDispatching.get()).booleanValue()) {
      return;
    }
    isDispatching.set(Boolean.valueOf(true));
    try
    {
      Queue localQueue = (Queue)eventsToDispatch.get();
      for (;;)
      {
        EventWithSubscriber localEventWithSubscriber = (EventWithSubscriber)localQueue.poll();
        if (localEventWithSubscriber == null) {
          break;
        }
        dispatch(event, subscriber);
      }
      isDispatching.remove();
    }
    finally
    {
      isDispatching.remove();
      eventsToDispatch.remove();
    }
    eventsToDispatch.remove();
  }
  
  void enqueueEvent(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    ((Queue)eventsToDispatch.get()).offer(new EventWithSubscriber(paramObject, paramEventSubscriber));
  }
  
  @VisibleForTesting
  Set<Class<?>> flattenHierarchy(Class<?> paramClass)
  {
    try
    {
      paramClass = (Set)flattenHierarchyCache.getUnchecked(paramClass);
      return paramClass;
    }
    catch (UncheckedExecutionException paramClass)
    {
      throw Throwables.propagate(paramClass.getCause());
    }
  }
  
  public void post(Object paramObject)
  {
    Object localObject1 = flattenHierarchy(paramObject.getClass());
    int i = 0;
    localObject1 = ((Set)localObject1).iterator();
    while (((Iterator)localObject1).hasNext())
    {
      Object localObject2 = (Class)((Iterator)localObject1).next();
      subscribersByTypeLock.readLock().lock();
      try
      {
        localObject2 = subscribersByType.get(localObject2);
        if (!((Set)localObject2).isEmpty())
        {
          int j = 1;
          localObject2 = ((Set)localObject2).iterator();
          for (;;)
          {
            i = j;
            if (!((Iterator)localObject2).hasNext()) {
              break;
            }
            enqueueEvent(paramObject, (EventSubscriber)((Iterator)localObject2).next());
          }
        }
      }
      finally
      {
        subscribersByTypeLock.readLock().unlock();
      }
    }
    if ((i == 0) && (!(paramObject instanceof DeadEvent))) {
      post(new DeadEvent(this, paramObject));
    }
    dispatchQueuedEvents();
  }
  
  public void register(Object paramObject)
  {
    paramObject = finder.findAllSubscribers(paramObject);
    subscribersByTypeLock.writeLock().lock();
    try
    {
      subscribersByType.putAll((Multimap)paramObject);
      return;
    }
    finally
    {
      subscribersByTypeLock.writeLock().unlock();
    }
  }
  
  public void unregister(Object paramObject)
  {
    Iterator localIterator = finder.findAllSubscribers(paramObject).asMap().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Object localObject2 = (Map.Entry)localIterator.next();
      Object localObject1 = (Class)((Map.Entry)localObject2).getKey();
      localObject2 = (Collection)((Map.Entry)localObject2).getValue();
      subscribersByTypeLock.writeLock().lock();
      try
      {
        localObject1 = subscribersByType.get(localObject1);
        if (!((Set)localObject1).containsAll((Collection)localObject2)) {
          throw new IllegalArgumentException("missing event subscriber for an annotated method. Is " + paramObject + " registered?");
        }
      }
      finally
      {
        subscribersByTypeLock.writeLock().unlock();
      }
      ((Set)localObject1).removeAll((Collection)localObject2);
      subscribersByTypeLock.writeLock().unlock();
    }
  }
  
  static class EventWithSubscriber
  {
    final Object event;
    final EventSubscriber subscriber;
    
    public EventWithSubscriber(Object paramObject, EventSubscriber paramEventSubscriber)
    {
      event = Preconditions.checkNotNull(paramObject);
      subscriber = ((EventSubscriber)Preconditions.checkNotNull(paramEventSubscriber));
    }
  }
  
  private static final class LoggingSubscriberExceptionHandler
    implements SubscriberExceptionHandler
  {
    private final Logger logger;
    
    public LoggingSubscriberExceptionHandler(String paramString)
    {
      logger = Logger.getLogger(EventBus.class.getName() + "." + (String)Preconditions.checkNotNull(paramString));
    }
    
    public void handleException(Throwable paramThrowable, SubscriberExceptionContext paramSubscriberExceptionContext)
    {
      logger.log(Level.SEVERE, "Could not dispatch event: " + paramSubscriberExceptionContext.getSubscriber() + " to " + paramSubscriberExceptionContext.getSubscriberMethod(), paramThrowable.getCause());
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.EventBus
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */