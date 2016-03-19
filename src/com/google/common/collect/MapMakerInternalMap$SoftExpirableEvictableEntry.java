package com.google.common.collect;

import java.lang.ref.ReferenceQueue;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

final class MapMakerInternalMap$SoftExpirableEvictableEntry<K, V>
  extends MapMakerInternalMap.SoftEntry<K, V>
  implements MapMakerInternalMap.ReferenceEntry<K, V>
{
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> nextEvictable = MapMakerInternalMap.nullEntry();
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> nextExpirable = MapMakerInternalMap.nullEntry();
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> previousEvictable = MapMakerInternalMap.nullEntry();
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> previousExpirable = MapMakerInternalMap.nullEntry();
  volatile long time = Long.MAX_VALUE;
  
  MapMakerInternalMap$SoftExpirableEvictableEntry(ReferenceQueue<K> paramReferenceQueue, K paramK, int paramInt, @Nullable MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramReferenceQueue, paramK, paramInt, paramReferenceEntry);
  }
  
  public long getExpirationTime()
  {
    return time;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getNextEvictable()
  {
    return nextEvictable;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getNextExpirable()
  {
    return nextExpirable;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getPreviousEvictable()
  {
    return previousEvictable;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getPreviousExpirable()
  {
    return previousExpirable;
  }
  
  public void setExpirationTime(long paramLong)
  {
    time = paramLong;
  }
  
  public void setNextEvictable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextEvictable = paramReferenceEntry;
  }
  
  public void setNextExpirable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextExpirable = paramReferenceEntry;
  }
  
  public void setPreviousEvictable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousEvictable = paramReferenceEntry;
  }
  
  public void setPreviousExpirable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousExpirable = paramReferenceEntry;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapMakerInternalMap.SoftExpirableEvictableEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */