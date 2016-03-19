package com.google.common.eventbus;

import com.google.common.cache.CacheLoader;
import com.google.common.collect.ImmutableList;
import java.lang.reflect.Method;

final class AnnotatedSubscriberFinder$1
  extends CacheLoader<Class<?>, ImmutableList<Method>>
{
  public ImmutableList<Method> load(Class<?> paramClass)
    throws Exception
  {
    return AnnotatedSubscriberFinder.access$000(paramClass);
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.AnnotatedSubscriberFinder.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */