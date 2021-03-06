package com.google.common.collect;

import java.lang.ref.ReferenceQueue;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;

final class MapMakerInternalMap$WeakEvictableEntry<K, V>
  extends MapMakerInternalMap.WeakEntry<K, V>
  implements MapMakerInternalMap.ReferenceEntry<K, V>
{
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> nextEvictable = MapMakerInternalMap.nullEntry();
  @GuardedBy("Segment.this")
  MapMakerInternalMap.ReferenceEntry<K, V> previousEvictable = MapMakerInternalMap.nullEntry();
  
  MapMakerInternalMap$WeakEvictableEntry(ReferenceQueue<K> paramReferenceQueue, K paramK, int paramInt, @Nullable MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    super(paramReferenceQueue, paramK, paramInt, paramReferenceEntry);
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getNextEvictable()
  {
    return nextEvictable;
  }
  
  public MapMakerInternalMap.ReferenceEntry<K, V> getPreviousEvictable()
  {
    return previousEvictable;
  }
  
  public void setNextEvictable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    nextEvictable = paramReferenceEntry;
  }
  
  public void setPreviousEvictable(MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry)
  {
    previousEvictable = paramReferenceEntry;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapMakerInternalMap.WeakEvictableEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */