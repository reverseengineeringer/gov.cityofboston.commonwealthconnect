package com.google.common.cache;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;

class LocalCache$WeakValueReference<K, V>
  extends WeakReference<V>
  implements LocalCache.ValueReference<K, V>
{
  final LocalCache.ReferenceEntry<K, V> entry;
  
  LocalCache$WeakValueReference(ReferenceQueue<V> paramReferenceQueue, V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramV, paramReferenceQueue);
    entry = paramReferenceEntry;
  }
  
  public LocalCache.ValueReference<K, V> copyFor(ReferenceQueue<V> paramReferenceQueue, V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return new WeakValueReference(paramReferenceQueue, paramV, paramReferenceEntry);
  }
  
  public LocalCache.ReferenceEntry<K, V> getEntry()
  {
    return entry;
  }
  
  public int getWeight()
  {
    return 1;
  }
  
  public boolean isActive()
  {
    return true;
  }
  
  public boolean isLoading()
  {
    return false;
  }
  
  public void notifyNewValue(V paramV) {}
  
  public V waitForValue()
  {
    return (V)get();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WeakValueReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */