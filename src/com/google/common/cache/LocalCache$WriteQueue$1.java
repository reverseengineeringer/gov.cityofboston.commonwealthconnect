package com.google.common.cache;

class LocalCache$WriteQueue$1
  extends LocalCache.AbstractReferenceEntry<K, V>
{
  LocalCache.ReferenceEntry<K, V> nextWrite = this;
  LocalCache.ReferenceEntry<K, V> previousWrite = this;
  
  LocalCache$WriteQueue$1(LocalCache.WriteQueue paramWriteQueue) {}
  
  public LocalCache.ReferenceEntry<K, V> getNextInWriteQueue()
  {
    return nextWrite;
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInWriteQueue()
  {
    return previousWrite;
  }
  
  public long getWriteTime()
  {
    return Long.MAX_VALUE;
  }
  
  public void setNextInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextWrite = paramReferenceEntry;
  }
  
  public void setPreviousInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousWrite = paramReferenceEntry;
  }
  
  public void setWriteTime(long paramLong) {}
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WriteQueue.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */