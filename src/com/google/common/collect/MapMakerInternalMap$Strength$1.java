package com.google.common.collect;

import com.google.common.base.Equivalence;

 enum MapMakerInternalMap$Strength$1
{
  MapMakerInternalMap$Strength$1()
  {
    super(paramString, paramInt, null);
  }
  
  Equivalence<Object> defaultEquivalence()
  {
    return Equivalence.equals();
  }
  
  <K, V> MapMakerInternalMap.ValueReference<K, V> referenceValue(MapMakerInternalMap.Segment<K, V> paramSegment, MapMakerInternalMap.ReferenceEntry<K, V> paramReferenceEntry, V paramV)
  {
    return new MapMakerInternalMap.StrongValueReference(paramV);
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.MapMakerInternalMap.Strength.1
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */