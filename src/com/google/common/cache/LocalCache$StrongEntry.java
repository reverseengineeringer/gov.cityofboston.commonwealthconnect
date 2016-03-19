package com.google.common.cache;

import javax.annotation.Nullable;

class LocalCache$StrongEntry<K, V>
  extends LocalCache.AbstractReferenceEntry<K, V>
{
  final int hash;
  final K key;
  final LocalCache.ReferenceEntry<K, V> next;
  volatile LocalCache.ValueReference<K, V> valueReference = LocalCache.unset();
  
  LocalCache$StrongEntry(K paramK, int paramInt, @Nullable LocalCache.ReferenceEntry<K, V> paramReferenceEntry)
  {
    key = paramK;
    hash = paramInt;
    next = paramReferenceEntry;
  }
  
  public int getHash()
  {
    return hash;
  }
  
  public K getKey()
  {
    return (K)key;
  }
  
  public LocalCache.ReferenceEntry<K, V> getNext()
  {
    return next;
  }
  
  public LocalCache.ValueReference<K, V> getValueReference()
  {
    return valueReference;
  }
  
  public void setValueReference(LocalCache.ValueReference<K, V> paramValueReference)
  {
    valueReference = paramValueReference;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.StrongEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */