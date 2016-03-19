package com.google.common.cache;

 enum CacheBuilder$NullListener
  implements RemovalListener<Object, Object>
{
  INSTANCE;
  
  private CacheBuilder$NullListener() {}
  
  public void onRemoval(RemovalNotification<Object, Object> paramRemovalNotification) {}
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilder.NullListener
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */