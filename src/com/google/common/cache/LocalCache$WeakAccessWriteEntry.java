package com.google.common.cache;

import java.lang.ref.ReferenceQueue;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

final class LocalCache$WeakAccessWriteEntry<K, V>
  extends LocalCache.WeakEntry<K, V>
{
  volatile long accessTime = Long.MAX_VALUE;
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> nextAccess = LocalCache.nullEntry();
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> nextWrite = LocalCache.nullEntry();
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> previousAccess = LocalCache.nullEntry();
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> previousWrite = LocalCache.nullEntry();
  volatile long writeTime = Long.MAX_VALUE;
  
  LocalCache$WeakAccessWriteEntry(ReferenceQueue<K> paramReferenceQueue, K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramReferenceQueue, paramK, paramInt, paramReferenceEntry);
  }
  
  public long getAccessTime()
  {
    return accessTime;
  }
  
  public LocalCache.ReferenceEntry<K, V> getNextInAccessQueue()
  {
    return nextAccess;
  }
  
  public LocalCache.ReferenceEntry<K, V> getNextInWriteQueue()
  {
    return nextWrite;
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInAccessQueue()
  {
    return previousAccess;
  }
  
  public LocalCache.ReferenceEntry<K, V> getPreviousInWriteQueue()
  {
    return previousWrite;
  }
  
  public long getWriteTime()
  {
    return writeTime;
  }
  
  public void setAccessTime(long paramLong)
  {
    accessTime = paramLong;
  }
  
  public void setNextInAccessQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextAccess = paramReferenceEntry;
  }
  
  public void setNextInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextWrite = paramReferenceEntry;
  }
  
  public void setPreviousInAccessQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousAccess = paramReferenceEntry;
  }
  
  public void setPreviousInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousWrite = paramReferenceEntry;
  }
  
  public void setWriteTime(long paramLong)
  {
    writeTime = paramLong;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WeakAccessWriteEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */