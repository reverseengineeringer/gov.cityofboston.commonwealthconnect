package com.google.common.collect;

import com.google.common.primitives.Primitives;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class ImmutableClassToInstanceMap$Builder<B>
{
  private final ImmutableMap.Builder<Class<? extends B>, B> mapBuilder = ImmutableMap.builder();
  
  private static <B, T extends B> T cast(Class<T> paramClass, B paramB)
  {
    return (T)Primitives.wrap(paramClass).cast(paramB);
  }
  
  public ImmutableClassToInstanceMap<B> build()
  {
    return new ImmutableClassToInstanceMap(mapBuilder.build(), null);
  }
  
  public <T extends B> Builder<B> put(Class<T> paramClass, T paramT)
  {
    mapBuilder.put(paramClass, paramT);
    return this;
  }
  
  public <T extends B> Builder<B> putAll(Map<? extends Class<? extends T>, ? extends T> paramMap)
  {
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Object localObject = (Map.Entry)paramMap.next();
      Class localClass = (Class)((Map.Entry)localObject).getKey();
      localObject = ((Map.Entry)localObject).getValue();
      mapBuilder.put(localClass, cast(localClass, localObject));
    }
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableClassToInstanceMap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */