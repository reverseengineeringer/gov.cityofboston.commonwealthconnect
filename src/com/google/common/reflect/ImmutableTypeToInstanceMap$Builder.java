package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;

@Beta
public final class ImmutableTypeToInstanceMap$Builder<B>
{
  private final ImmutableMap.Builder<TypeToken<? extends B>, B> mapBuilder = ImmutableMap.builder();
  
  public ImmutableTypeToInstanceMap<B> build()
  {
    return new ImmutableTypeToInstanceMap(mapBuilder.build(), null);
  }
  
  public <T extends B> Builder<B> put(TypeToken<T> paramTypeToken, T paramT)
  {
    mapBuilder.put(paramTypeToken.rejectTypeVariables(), paramT);
    return this;
  }
  
  public <T extends B> Builder<B> put(Class<T> paramClass, T paramT)
  {
    mapBuilder.put(TypeToken.of(paramClass), paramT);
    return this;
  }
}

/* Location:
 * Qualified Name:     com.google.common.reflect.ImmutableTypeToInstanceMap.Builder
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */