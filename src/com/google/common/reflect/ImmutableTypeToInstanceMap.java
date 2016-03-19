package com.google.common.reflect;

import com.google.common.annotations.Beta;
import com.google.common.collect.ForwardingMap;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableMap.Builder;
import java.util.Map;

@Beta
public final class ImmutableTypeToInstanceMap<B>
  extends ForwardingMap<TypeToken<? extends B>, B>
  implements TypeToInstanceMap<B>
{
  private final ImmutableMap<TypeToken<? extends B>, B> delegate;
  
  private ImmutableTypeToInstanceMap(ImmutableMap<TypeToken<? extends B>, B> paramImmutableMap)
  {
    delegate = paramImmutableMap;
  }
  
  public static <B> Builder<B> builder()
  {
    return new Builder(null);
  }
  
  public static <B> ImmutableTypeToInstanceMap<B> of()
  {
    return new ImmutableTypeToInstanceMap(ImmutableMap.of());
  }
  
  private <T extends B> T trustedGet(TypeToken<T> paramTypeToken)
  {
    return (T)delegate.get(paramTypeToken);
  }
  
  protected Map<TypeToken<? extends B>, B> delegate()
  {
    return delegate;
  }
  
  public <T extends B> T getInstance(TypeToken<T> paramTypeToken)
  {
    return (T)trustedGet(paramTypeToken.rejectTypeVariables());
  }
  
  public <T extends B> T getInstance(Class<T> paramClass)
  {
    return (T)trustedGet(TypeToken.of(paramClass));
  }
  
  public <T extends B> T putInstance(TypeToken<T> paramTypeToken, T paramT)
  {
    throw new UnsupportedOperationException();
  }
  
  public <T extends B> T putInstance(Class<T> paramClass, T paramT)
  {
    throw new UnsupportedOperationException();
  }
  
  @Beta
  public static final class Builder<B>
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
}

/* Location:
 * Qualified Name:     com.google.common.reflect.ImmutableTypeToInstanceMap
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */