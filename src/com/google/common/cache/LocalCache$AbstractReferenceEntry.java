package com.google.common.cache;

abstract class LocalCache$AbstractReferenceEntry<K, V>
  implements LocalCache.ReferenceEntry<K, V>
{
  public long getAccessTime()
  {
    throw new UnsupportedOperationException();
  }
  
  public int getHash()
  {
    throw new UnsupportedOperationException();
  }
  
  public K getKey()
  {
    throw new UnsupportedOperationException();
  }
  
  public LocalCache.ReferenceEntry<K, V> getNext()
  {
    throw new UnsupportedOperationException();
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
    throw new UnsupportedOperationException();
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
    throw new UnsupportedOperationException();
  }
  
  public void setWriteTime(long paramLong)
  {
    throw new UnsupportedOperationException();
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.AbstractReferenceEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */