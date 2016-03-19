package com.google.common.cache;

import com.google.common.base.Preconditions;

class CacheBuilderSpec$ConcurrencyLevelParser
  extends CacheBuilderSpec.IntegerParser
{
  protected void parseInteger(CacheBuilderSpec paramCacheBuilderSpec, int paramInt)
  {
    if (concurrencyLevel == null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "concurrency level was already set to ", new Object[] { concurrencyLevel });
      concurrencyLevel = Integer.valueOf(paramInt);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.ConcurrencyLevelParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */