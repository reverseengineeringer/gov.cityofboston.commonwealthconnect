package com.google.common.cache;

import com.google.common.base.Equivalence;

 enum LocalCache$Strength$2
{
  LocalCache$Strength$2()
  {
    super(paramString, paramInt, null);
  }
  
  Equivalence<Object> defaultEquivalence()
  {
    return Equivalence.identity();
  }
  
  <K, V> LocalCache.ValueReference<K, V> referenceValue(LocalCache.Segment<K, V> paramSegment, LocalCache.ReferenceEntry<K, V> paramReferenceEntry, V paramV, int paramInt)
  {
    if (paramInt == 1) {
      return new LocalCache.SoftValueReference(valueReferenceQueue, paramV, paramReferenceEntry);
    }
    return new LocalCache.WeightedSoftValueReference(valueReferenceQueue, paramV, paramReferenceEntry, paramInt);
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.Strength.2
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */