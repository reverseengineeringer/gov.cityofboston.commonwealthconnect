package com.google.common.eventbus;

import com.google.common.base.Objects;
import com.google.common.base.Throwables;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Maps;
import com.google.common.collect.Multimap;
import com.google.common.reflect.TypeToken;
import com.google.common.reflect.TypeToken.TypeSet;
import com.google.common.util.concurrent.UncheckedExecutionException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.annotation.Nullable;

class AnnotatedSubscriberFinder
  implements SubscriberFindingStrategy
{
  private static final LoadingCache<Class<?>, ImmutableList<Method>> subscriberMethodsCache = CacheBuilder.newBuilder().weakKeys().build(new CacheLoader()
  {
    public ImmutableList<Method> load(Class<?> paramAnonymousClass)
      throws Exception
    {
      return AnnotatedSubscriberFinder.getAnnotatedMethodsInternal(paramAnonymousClass);
    }
  });
  
  private static ImmutableList<Method> getAnnotatedMethods(Class<?> paramClass)
  {
    try
    {
      paramClass = (ImmutableList)subscriberMethodsCache.getUnchecked(paramClass);
      return paramClass;
    }
    catch (UncheckedExecutionException paramClass)
    {
      throw Throwables.propagate(paramClass.getCause());
    }
  }
  
  private static ImmutableList<Method> getAnnotatedMethodsInternal(Class<?> paramClass)
  {
    Object localObject1 = TypeToken.of(paramClass).getTypes().rawTypes();
    paramClass = Maps.newHashMap();
    localObject1 = ((Set)localObject1).iterator();
    while (((Iterator)localObject1).hasNext())
    {
      Method[] arrayOfMethod = ((Class)((Iterator)localObject1).next()).getMethods();
      int j = arrayOfMethod.length;
      int i = 0;
      while (i < j)
      {
        Method localMethod = arrayOfMethod[i];
        if (localMethod.isAnnotationPresent(Subscribe.class))
        {
          Object localObject2 = localMethod.getParameterTypes();
          if (localObject2.length != 1) {
            throw new IllegalArgumentException("Method " + localMethod + " has @Subscribe annotation, but requires " + localObject2.length + " arguments.  Event subscriber methods must require a single argument.");
          }
          localObject2 = new MethodIdentifier(localMethod);
          if (!paramClass.containsKey(localObject2)) {
            paramClass.put(localObject2, localMethod);
          }
        }
        i += 1;
      }
    }
    return ImmutableList.copyOf(paramClass.values());
  }
  
  private static EventSubscriber makeSubscriber(Object paramObject, Method paramMethod)
  {
    if (methodIsDeclaredThreadSafe(paramMethod)) {
      return new EventSubscriber(paramObject, paramMethod);
    }
    return new SynchronizedEventSubscriber(paramObject, paramMethod);
  }
  
  private static boolean methodIsDeclaredThreadSafe(Method paramMethod)
  {
    return paramMethod.getAnnotation(AllowConcurrentEvents.class) != null;
  }
  
  public Multimap<Class<?>, EventSubscriber> findAllSubscribers(Object paramObject)
  {
    HashMultimap localHashMultimap = HashMultimap.create();
    Iterator localIterator = getAnnotatedMethods(paramObject.getClass()).iterator();
    while (localIterator.hasNext())
    {
      Method localMethod = (Method)localIterator.next();
      localHashMultimap.put(localMethod.getParameterTypes()[0], makeSubscriber(paramObject, localMethod));
    }
    return localHashMultimap;
  }
  
  private static final class MethodIdentifier
  {
    private final String name;
    private final List<Class<?>> parameterTypes;
    
    MethodIdentifier(Method paramMethod)
    {
      name = paramMethod.getName();
      parameterTypes = Arrays.asList(paramMethod.getParameterTypes());
    }
    
    public boolean equals(@Nullable Object paramObject)
    {
      boolean bool2 = false;
      boolean bool1 = bool2;
      if ((paramObject instanceof MethodIdentifier))
      {
        paramObject = (MethodIdentifier)paramObject;
        bool1 = bool2;
        if (name.equals(name))
        {
          bool1 = bool2;
          if (parameterTypes.equals(parameterTypes)) {
            bool1 = true;
          }
        }
      }
      return bool1;
    }
    
    public int hashCode()
    {
      return Objects.hashCode(new Object[] { name, parameterTypes });
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.AnnotatedSubscriberFinder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */