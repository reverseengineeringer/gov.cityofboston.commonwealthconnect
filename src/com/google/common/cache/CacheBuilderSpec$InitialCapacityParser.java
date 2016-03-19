package com.google.common.cache;

import com.google.common.base.Preconditions;

class CacheBuilderSpec$InitialCapacityParser
  extends CacheBuilderSpec.IntegerParser
{
  protected void parseInteger(CacheBuilderSpec paramCacheBuilderSpec, int paramInt)
  {
    if (initialCapacity == null) {}
    for (boolean bool = true;; bool = false)
    {
      Preconditions.checkArgument(bool, "initial capacity was already set to ", new Object[] { initialCapacity });
      initialCapacity = Integer.valueOf(paramInt);
      return;
    }
  }
}

/* Location:
 * Qualified Name:     com.google.common.cache.CacheBuilderSpec.InitialCapacityParser
 * Java Class Version: 6 (50.0)
 * JD-Core Version:    0.7.1
 */