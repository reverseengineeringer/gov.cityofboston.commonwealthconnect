package com.google.common.collect;

import javax.annotation.Nullable;

final class HashBiMap$BiEntry<K, V>
  extends ImmutableEntry<K, V>
{
  final int keyHash;
  @Nullable
  BiEntry<K, V> nextInKToVBucket;
  @Nullable
  BiEntry<K, V> nextInVToKBucket;
  final int valueHash;
  
  HashBiMap$BiEntry(K paramK, int paramInt1, V paramV, int paramInt2)
  {
    super(paramK, paramV);
    keyHash = paramInt1;
    valueHash = paramInt2;
  }
}

/* Location:
 * Qualified Name:     com.google.common.collect.HashBiMap.BiEntry
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */