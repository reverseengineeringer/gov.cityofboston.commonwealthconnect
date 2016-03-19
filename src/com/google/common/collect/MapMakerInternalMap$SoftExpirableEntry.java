package com.google.common.collect;

import java.lang.ref.ReferenceQueue;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

final class MapMakerInternalMap$SoftExpirableEntry<K, V>
  extends MapMakerInternalMap.SoftEntry<K, V>
  implements MapMakerInternalMap.ReferenceEntry<K, V>
{
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> nextExpirable = MapMakerInternalMap.nullEntry();
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> previousExpirable = MapMakerInternalMap.nullEntry();
  volatile long time = Long.MAX_VALUE;
  
  MapMakerInternalMap$SoftExpirableEntry(ReferenceQueue<K> paramReferenceQueue, K paramK, int paramInt, @Nullable MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramReferenceQueue, paramK, paramInt, paramReferenceEntry);
  }
  
  public long getExpirationTime()
  {
    return time;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getNextExpirable()
  {
    return nextExpirable;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getPreviousExpirable()
  {
    return previousExpirable;
  }
  
  public void setExpirationTime(long paramLong)
  {
    time = paramLong;
  }
  
  public void setNextExpirable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextExpirable = paramReferenceEntry;
  }
  
  public void setPreviousExpirable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousExpirable = paramReferenceEntry;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapMakerInternalMap.SoftExpirableEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */