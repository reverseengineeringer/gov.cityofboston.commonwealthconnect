package com.google.common.cache;

final class LocalCache$WeightedStrongValueReference<K, V>
  extends LocalCache.StrongValueReference<K, V>
{
  final int weight;
  
  LocalCache$WeightedStrongValueReference(V paramV, int paramInt)
  {
    super(paramV);
    weight = paramInt;
  }
  
  public int getWeight()
  {
    return weight;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.LocalCache.WeightedStrongValueReference
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */