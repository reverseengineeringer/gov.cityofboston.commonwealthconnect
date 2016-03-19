package com.google.common.cache;

import java.lang.ref.ReferenceQueue;
import java.util.concurrent.ExecutionException;
import javax.annotation.Nullable;

abstract interface LocalCache$ValueReference<K, V>
{
  public abstract ValueReference<K, V> copyFor(ReferenceQueue<V> paramReferenceQueue, @Nullable V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry);
  
  @Nullable
  public abstract V get();
  
  @Nullable
  public abstract LocalCache.ReferenceEntry<K, V> getEntry();
  
  public abstract int getWeight();
  
  public abstract boolean isActive();
  
  public abstract boolean isLoading();
  
  public abstract void notifyNewValue(@Nullable V paramV);
  
  public abstract V waitForValue()
    throws ExecutionException;
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.ValueReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */