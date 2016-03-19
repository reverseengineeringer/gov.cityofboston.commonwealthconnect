package com.google.common.cache;

import com.google.common.collect.ImmutableMap;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.Serializable;
import java.util.concurrent.ExecutionException;

final class LocalCache$LoadingSerializationProxy<K, V>
  extends LocalCache.ManualSerializationProxy<K, V>
  implements LoadingCache<K, V>, Serializable
{
  private static final long serialVersionUID = 1L;
  transient LoadingCache<K, V> autoDelegate;
  
  LocalCache$LoadingSerializationProxy(LocalCache<K, V> paramLocalCache)
  {
    super(paramLocalCache);
  }
  
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    autoDelegate = recreateCacheBuilder().build(loader);
  }
  
  private Object readResolve()
  {
    return autoDelegate;
  }
  
  public final V apply(K paramK)
  {
    return (V)autoDelegate.apply(paramK);
  }
  
  public V get(K paramK)
    throws ExecutionException
  {
    return (V)autoDelegate.get(paramK);
  }
  
  public ImmutableMap<K, V> getAll(Iterable<? extends K> paramIterable)
    throws ExecutionException
  {
    return autoDelegate.getAll(paramIterable);
  }
  
  public V getUnchecked(K paramK)
  {
    return (V)autoDelegate.getUnchecked(paramK);
  }
  
  public void refresh(K paramK)
  {
    autoDelegate.refresh(paramK);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.LoadingSerializationProxy
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */