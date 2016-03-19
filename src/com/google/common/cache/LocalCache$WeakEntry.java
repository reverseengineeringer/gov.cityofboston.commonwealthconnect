package com.google.common.cache;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import javax.annotation.Nullable;

class LocalCache$WeakEntry<K, V>
  extends WeakReference<K>
  implements LocalCache.ReferenceEntry<K, V>
{
  final int hash;
  final LocalCache.ReferenceEntry<K, V> next;
  volatile LocalCache.ValueReference<K, V> valueReference = LocalCache.unset();
  
  LocalCache$WeakEntry(ReferenceQueue<K> paramReferenceQueue, K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramK, paramReferenceQueue);
    hash = paramInt;
    next = paramReferenceEntry;
  }
  
  public long getAccessTime()
  {
    throw new UnsupportedOperationException();
  }
  
  public int getHash()
  {
    return hash;
  }
  
  public K getKey()
  {
    return (K)get();
  }
  
  public LocalCache.ReferenceEntry<K, V> getNext()
  {
    return next;
  }
  
  public LocalCache.ReferenceEntry<K, V> getNextInAccessQueue()
  {
    throw new UnsupportedOperationException();
  }
  
  public LocalCache.ReferenceEntry<K, V> getNextInWriteQueue()
  {
    throw new UnsupportedOperationException();
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInAccessQueue()
  {
    throw new UnsupportedOperationException();
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInWriteQueue()
  {
    throw new UnsupportedOperationException();
  }
  
  public LocalCache.ValueReference<K, V> getValueReference()
  {
    return valueReference;
  }
  
  public long getWriteTime()
  {
    throw new UnsupportedOperationException();
  }
  
  public void setAccessTime(long paramLong)
  {
    throw new UnsupportedOperationException();
  }
  
  public void setNextInAccessQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    throw new UnsupportedOperationException();
  }
  
  public void setNextInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    throw new UnsupportedOperationException();
  }
  
  public void setPreviousInAccessQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    throw new UnsupportedOperationException();
  }
  
  public void setPreviousInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    throw new UnsupportedOperationException();
  }
  
  public void setValueReference(LocalCache.ValueReference<K, V> paramValueReference)
  {
    valueReference = paramValueReference;
  }
  
  public void setWriteTime(long paramLong)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WeakEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */