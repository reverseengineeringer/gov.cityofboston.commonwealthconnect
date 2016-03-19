package com.google.common.cache;

 enum CacheBuilder$OneWeigher
  implements Weigher<Object, Object>
{
  INSTANCE;
  
  private CacheBuilder$OneWeigher() {}
  
  public int weigh(Object paramObject1, Object paramObject2)
  {
    return 1;
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilder.OneWeigher
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */