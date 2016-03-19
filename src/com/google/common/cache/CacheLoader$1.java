package com.google.common.cache;

import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.ListenableFutureTask;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;

final class CacheLoader$1
  extends CacheLoader<K, V>
{
  CacheLoader$1(CacheLoader paramCacheLoader, Executor paramExecutor) {}
  
  public V load(K paramK)
    throws Exception
  {
    return (V)val$loader.load(paramK);
  }
  
  public Map<K, V> loadAll(Iterable<? extends K> paramIterable)
    throws Exception
  {
    return val$loader.loadAll(paramIterable);
  }
  
  public ListenableFuture<V> reload(final K paramK, final V paramV)
    throws Exception
  {
    paramK = ListenableFutureTask.create(new Callable()
    {
      public V call()
        throws Exception
      {
        return (V)val$loader.reload(paramK, paramV).get();
      }
    });
    val$executor.execute(paramK);
    return paramK;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheLoader.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */