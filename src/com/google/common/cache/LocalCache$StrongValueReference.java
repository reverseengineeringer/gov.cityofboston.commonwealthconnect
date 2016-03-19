package com.google.common.cache;

import java.lang.ref.ReferenceQueue;

class LocalCache$StrongValueReference<K, V>
  implements LocalCache.ValueReference<K, V>
{
  final V referent;
  
  LocalCache$StrongValueReference(V paramV)
  {
    referent = paramV;
  }
  
  public LocalCache.ValueReference<K, V> copyFor(ReferenceQueue<V> paramReferenceQueue, V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return this;
  }
  
  public V get()
  {
    return (V)referent;
  }
  
  public LocalCache.ReferenceEntry<K, V> getEntry()
  {
    return null;
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
 * Qualified Name:     com.google.common.cache.LocalCache.StrongValueReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */