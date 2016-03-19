package com.google.common.cache;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;

@Beta
public abstract class ForwardingCache$SimpleForwardingCache<K, V>
  extends ForwardingCache<K, V>
{
  private final Cache<K, V> delegate;
  
  protected ForwardingCache$SimpleForwardingCache(Cache<K, V> paramCache)
  {
    delegate = ((Cache)Preconditions.checkNotNull(paramCache));
  }
  
  protected final Cache<K, V> delegate()
  {
    return delegate;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.ForwardingCache.SimpleForwardingCache
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */