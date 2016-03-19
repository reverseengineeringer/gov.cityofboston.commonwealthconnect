package com.google.common.cache;

import com.google.common.base.Preconditions;

abstract class CacheBuilderSpec$LongParser
  implements CacheBuilderSpec.ValueParser
{
  public void parse(CacheBuilderSpec paramCacheBuilderSpec, String paramString1, String paramString2)
  {
    if ((paramString2 != null) && (!paramString2.isEmpty())) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "value of key %s omitted", new Object[] { paramString1 });
      try
      {
        parseLong(paramCacheBuilderSpec, Long.parseLong(paramString2));
        return;
      }
      catch (NumberFormatException paramCacheBuilderSpec)
      {
        throw new IllegalArgumentException(String.format("key %s value set to %s, must be integer", new Object[] { paramString1, paramString2 }), paramCacheBuilderSpec);
      }
    }
  }
  
  protected abstract void parseLong(CacheBuilderSpec paramCacheBuilderSpec, long paramLong);
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.LongParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */