package com.google.common.cache;

import java.lang.ref.ReferenceQueue;

final class LocalCache$WeightedSoftValueReference<K, V>
  extends LocalCache.SoftValueReference<K, V>
{
  final int weight;
  
  LocalCache$WeightedSoftValueReference(ReferenceQueue<V> paramReferenceQueue, V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry, int paramInt)
  {
    super(paramReferenceQueue, paramV, paramReferenceEntry);
    weight = paramInt;
  }
  
  public LocalCache.ValueReference<K, V> copyFor(ReferenceQueue<V> paramReferenceQueue, V paramV, LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    return new WeightedSoftValueReference(paramReferenceQueue, paramV, paramReferenceEntry, weight);
  }
  
  public int getWeight()
  {
    return weight;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WeightedSoftValueReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */