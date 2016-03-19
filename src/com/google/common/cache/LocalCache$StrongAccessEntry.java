package com.google.common.cache;

import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

final class LocalCache$StrongAccessEntry<K, V>
  extends LocalCache.StrongEntry<K, V>
{
  volatile long accessTime = Long.MAX_VALUE;
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> nextAccess = LocalCache.nullEntry();
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> previousAccess = LocalCache.nullEntry();
  
  LocalCache$StrongAccessEntry(K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramK, paramInt, paramReferenceEntry);
  }
  
  public long getAccessTime()
  {
    return accessTime;
  }
  
  public LocalCache.ReferenceEntry<K, V> getNextInAccessQueue()
  {
    return nextAccess;
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInAccessQueue()
  {
    return previousAccess;
  }
  
  public void setAccessTime(long paramLong)
  {
    accessTime = paramLong;
  }
  
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
 * Qualified Name:     com.google.common.cache.LocalCache.StrongAccessEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */