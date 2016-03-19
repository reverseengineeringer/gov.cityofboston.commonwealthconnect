package com.google.common.cache;

class LocalCache$AccessQueue$1
  extends LocalCache.AbstractReferenceEntry<K, V>
{
  LocalCache.ReferenceEntry<K, V> nextAccess = this;
  LocalCache.ReferenceEntry<K, V> previousAccess = this;
  
  LocalCache$AccessQueue$1(LocalCache.AccessQueue paramAccessQueue) {}
  
  public long getAccessTime()
  {
    return Long.MAX_VALUE;
  }
  
  public LocalCache.ReferenceEntry<K, V> getNextInAccessQueue()
  {
    return nextAccess;
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInAccessQueue()
  {
    return previousAccess;
  }
  
  public void setAccessTime(long paramLong) {}
  
  public void setNextInAccessQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextAccess = paramReferenceEntry;
  }
  
  public void setPreviousInAccessQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousAccess = paramReferenceEntry;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.AccessQueue.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */