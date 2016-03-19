package com.google.common.cache;

import com.google.common.base.Function;
import com.google.common.base.Stopwatch;
import com.google.common.util.concurrent.Futures;
import com.google.common.util.concurrent.ListenableFuture;
import com.google.common.util.concurrent.SettableFuture;
import com.google.common.util.concurrent.Uninterruptibles;
import java.lang.ref.ReferenceQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import javax.annotation.Nullable;

class LocalCache$LoadingValueReference<K, V>
  implements LocalCache.ValueReference<K, V>
{
  final SettableFuture<V> futureValue = SettableFuture.create();
  volatile LocalCache.ValueReference<K, V> oldValue;
  final Stopwatch stopwatch = Stopwatch.createUnstarted();
  
  public LocalCache$LoadingValueReference()
  {
    this(LocalCache.unset());
  }
  
  public LocalCache$LoadingValueReference(LocalCache.ValueReference<K, V> paramValueReference)
  {
    oldValue = paramValueReference;
  }
  
  private ListenableFuture<V> fullyFailedFuture(Throwable paramThrowable)
  {
    return Futures.immediateFailedFuture(paramThrowable);
  }
  
  public LocalCache.ValueReference<K, V> copyFor(ReferenceQueue<V> paramReferenceQueue, @Nullable V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return this;
  }
  
  public long elapsedNanos()
  {
    return stopwatch.elapsed(TimeUnit.NANOSECONDS);
  }
  
  public V get()
  {
    return (V)oldValue.get();
  }
  
  public LocalCache.ReferenceEntry<K, V> getEntry()
  {
    return null;
  }
  
  public LocalCache.ValueReference<K, V> getOldValue()
  {
    return oldValue;
  }
  
  public int getWeight()
  {
    return oldValue.getWeight();
  }
  
  public boolean isActive()
  {
    return oldValue.isActive();
  }
  
  public boolean isLoading()
  {
    return true;
  }
  
  public ListenableFuture<V> loadFuture(K paramK, CacheLoader<? super K, V> paramCacheLoader)
  {
    stopwatch.start();
    Object localObject = oldValue.get();
    if (localObject == null) {}
    try
    {
      paramK = paramCacheLoader.load(paramK);
      if (set(paramK)) {
        return futureValue;
      }
      return Futures.immediateFuture(paramK);
    }
    catch (Throwable paramK)
    {
      if (!(paramK instanceof InterruptedException)) {
        break label91;
      }
      Thread.currentThread().interrupt();
      if (!setException(paramK)) {
        break label104;
      }
      return futureValue;
    }
    paramK = paramCacheLoader.reload(paramK, localObject);
    if (paramK == null) {
      return Futures.immediateFuture(null);
    }
    paramK = Futures.transform(paramK, new Function()
    {
      public V apply(V paramAnonymousV)
      {
        set(paramAnonymousV);
        return paramAnonymousV;
      }
    });
    return paramK;
    label91:
    label104:
    return fullyFailedFuture(paramK);
  }
  
  public void notifyNewValue(@Nullable V paramV)
  {
    if (paramV != null)
    {
      set(paramV);
      return;
    }
    oldValue = LocalCache.unset();
  }
  
  public boolean set(@Nullable V paramV)
  {
    return futureValue.set(paramV);
  }
  
  public boolean setException(Throwable paramThrowable)
  {
    return futureValue.setException(paramThrowable);
  }
  
  public V waitForValue()
    throws ExecutionException
  {
    return (V)Uninterruptibles.getUninterruptibly(futureValue);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.LoadingValueReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */