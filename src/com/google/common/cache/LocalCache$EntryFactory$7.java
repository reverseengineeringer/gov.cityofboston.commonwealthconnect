package com.google.common.cache;

import javax.annotation.Nullable;

 enum LocalCache$EntryFactory$7
{
  LocalCache$EntryFactory$7()
  {
    super(paramString, paramInt, null);
  }
  
  <K, V> LocalCache.ReferenceEntry<K, V> copyEntry(LocalCache.Segment<K, V> paramSegment, LocalCache.ReferenceEntry<K, V> paramReferenceEntry1, LocalCache.ReferenceEntry<K, V> paramReferenceEntry2)
  {
    paramSegment = super.copyEntry(paramSegment, paramReferenceEntry1, paramReferenceEntry2);
    copyWriteEntry(paramReferenceEntry1, paramSegment);
    return paramSegment;
  }
  
  <K, V> LocalCache.ReferenceEntry<K, V> newEntry(LocalCache.Segment<K, V> paramSegment, K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return new LocalCache.WeakWriteEntry(keyReferenceQueue, paramK, paramInt, paramReferenceEntry);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.EntryFactory.7
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */