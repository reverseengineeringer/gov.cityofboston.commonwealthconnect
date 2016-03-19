package com.google.common.collect;

import com.google.common.base.Preconditions;
import com.google.common.primitives.Primitives;
import java.io.Serializable;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

public final class ImmutableClassToInstanceMap<B>
  extends ForwardingMap<Class<? extends B>, B>
  implements ClassToInstanceMap<B>, Serializable
{
  private final ImmutableMap<Class<? extends B>, B> delegate;
  
  private ImmutableClassToInstanceMap(ImmutableMap<Class<? extends B>, B> paramImmutableMap)
  {
    delegate = paramImmutableMap;
  }
  
  public static <B> Builder<B> builder()
  {
    return new Builder();
  }
  
  public static <B, S extends B> ImmutableClassToInstanceMap<B> copyOf(Map<? extends Class<? extends S>, ? extends S> paramMap)
  {
    if ((paramMap instanceof ImmutableClassToInstanceMap)) {
      return (ImmutableClassToInstanceMap)paramMap;
    }
    return new Builder().putAll(paramMap).build();
  }
  
  protected Map<Class<? extends B>, B> delegate()
  {
    return delegate;
  }
  
  @Nullable
  public <T extends B> T getInstance(Class<T> paramClass)
  {
    return (T)delegate.get(Preconditions.checkNotNull(paramClass));
  }
  
  @Deprecated
  public <T extends B> T putInstance(Class<T> paramClass, T paramT)
  {
    throw new UnsupportedOperationException();
  }
  
  public static final class Builder<B>
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
}

/* Location:
 * Qualified Name:     com.google.common.collect.ImmutableClassToInstanceMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */