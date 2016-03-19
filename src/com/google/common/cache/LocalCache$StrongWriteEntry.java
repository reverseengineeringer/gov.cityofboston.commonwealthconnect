package com.google.common.cache;

import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

final class LocalCache$StrongWriteEntry<K, V>
  extends LocalCache.StrongEntry<K, V>
{
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> nextWrite = LocalCache.nullEntry();
  @GuardedBy("Segment.this")
  LocalCache.ReferenceEntry<K, V> previousWrite = LocalCache.nullEntry();
  volatile long writeTime = Long.MAX_VALUE;
  
  LocalCache$StrongWriteEntry(K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramK, paramInt, paramReferenceEntry);
  }
  
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
    return writeTime;
  }
  
  public void setNextInWriteQueue(LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextWrite = paramReferenceEntry;
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
 * Qualified Name:     com.google.common.cache.LocalCache.StrongWriteEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */