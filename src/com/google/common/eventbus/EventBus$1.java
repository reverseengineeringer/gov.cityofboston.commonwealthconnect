package com.google.common.eventbus;

import com.google.common.cache.CacheLoader;
import com.google.common.reflect.TypeToken;
import com.google.common.reflect.TypeToken.TypeSet;
import java.util.Set;

final class EventBus$1
  extends CacheLoader<Class<?>, Set<Class<?>>>
{
  public Set<Class<?>> load(Class<?> paramClass)
  {
    return TypeToken.of(paramClass).getTypes().rawTypes();
  }
}

/* Location:
 * Qualified Name:     com.google.common.eventbus.EventBus.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */