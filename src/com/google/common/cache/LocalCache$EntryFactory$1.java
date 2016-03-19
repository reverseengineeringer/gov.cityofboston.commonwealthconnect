package com.google.common.cache;

import javax.annotation.Nullable;

 enum LocalCache$EntryFactory$1
{
  LocalCache$EntryFactory$1()
  {
    super(paramString, paramInt, null);
  }
  
  <K, V> LocalCache.ReferenceEntry<K, V> newEntry(LocalCache.Segment<K, V> paramSegment, K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return new LocalCache.StrongEntry(paramK, paramInt, paramReferenceEntry);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.EntryFactory.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */