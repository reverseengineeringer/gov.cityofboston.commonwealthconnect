package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableMap;
import java.util.concurrent.ExecutionException;

@Beta
public abstract class ForwardingLoadingCache<K, V>
  extends ForwardingCache<K, V>
  implements LoadingCache<K, V>
{
  public V apply(K paramK)
  {
    return (V)delegate().apply(paramK);
  }
  
  protected abstract LoadingCache<K, V> delegate();
  
  public V get(K paramK)
    throws ExecutionException
  {
    return (V)delegate().get(paramK);
  }
  
  public ImmutableMap<K, V> getAll(Iterable<? extends K> paramIterable)
    throws ExecutionException
  {
    return delegate().getAll(paramIterable);
  }
  
  public V getUnchecked(K paramK)
  {
    return (V)delegate().getUnchecked(paramK);
  }
  
  public void refresh(K paramK)
  {
    delegate().refresh(paramK);
  }
  
  @Beta
  public static abstract class SimpleForwardingLoadingCache<K, V>
    extends ForwardingLoadingCache<K, V>
  {
    private final LoadingCache<K, V> delegate;
    
    protected SimpleForwardingLoadingCache(LoadingCache<K, V> paramLoadingCache)
    {
      delegate = ((LoadingCache)Preconditions.checkNotNull(paramLoadingCache));
    }
    
    protected final LoadingCache<K, V> delegate()
    {
      return delegate;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.ForwardingLoadingCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */